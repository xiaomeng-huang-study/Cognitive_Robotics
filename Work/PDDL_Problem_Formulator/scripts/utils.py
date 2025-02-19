#!/usr/bin/env python

from typing import List
import os
import re
import random
import argparse
from collections import defaultdict

import numpy as np
import torch
from torchvision.ops import box_convert


def seed_everything(seed: int=42):
    random.seed(seed)
    os.environ['PYTHONHASHSEED'] = str(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = True


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument("--domain_name", type=str, default=None, help="domain name e.g. blocksworld")
    
    parser.add_argument("--examples_dir", type=str, default=None, help="directory for examples")
    parser.add_argument("--targets_dir", type=str, default=None, help="directory for targets")
    
    parser.add_argument("--seed", type=int, default=42, help="random seed")
    
    parser.add_argument("--llm_model", type=str, default=None, help="choose the llm model. e.g. llama3.2, llama3.1, llama3.2-vision, gemini-2.0-flash")
    parser.add_argument("--generate_problem", action="store_true", help="generate PDDL problems")
    parser.add_argument("--gen_step", type=str, default="plain", help="PDDL generation step")
    parser.add_argument("--num_repeat", type=int, default=1, help="the number of problems to generate per task")
    
    
    parser.add_argument("--predict_bboxes", action="store_false", help="detect objects with bboxes and generate captions")
    parser.add_argument("--refine_problem", action="store_false", help="refine generated problems by corrective reprompting")
    parser.add_argument("--find_plan", action="store_false", help="refine generated problems by corrective reprompting")
    
    # grounding dino
    parser.add_argument("--grounding_dino_dir", type=str, default=None, help="directory for grounding dino")
    parser.add_argument("--box_threshold", type=float, default=0.35, help="")
    parser.add_argument("--text_threshold", type=float, default=0.25, help="")

    # downward
    parser.add_argument("--downward_dir", type=str, default=None, help="")
    parser.add_argument("--time_limit", type=int, default=200, help="")
    
    parser.add_argument("--use_cot", action="store_false", help="refine problem with chain-of-thought (cot)")
    parser.add_argument("--refine_all", action="store_false", help="refine all problems regardless of errors")
    
    args = parser.parse_args()

    return args


def get_text_query(domain_name: str):
    def get_token_spans(
        query: str,
        phrases: List[str],
    ):
        token_spans = []

        for phrase in phrases:
            span_list = []

            start = query.find(f"{phrase} .")
            for word in phrase.split(" "):
                span_list += [[start, start + len(word)]]
                start += len(word) + 1

            token_spans += [span_list]

        return token_spans

    if domain_name == "blocksworld":
        text_phrases = [
            "red block", 
            "blue block", 
            "green block", 
            "yellow block", 
            "purple block", 
            "orange block", 
            "pink block", 
        ]

        phrase2object = None
    elif domain_name == "hanoi":
        text_phrases = [
            "blue disk", 
            "green disk", 
            "yellow disk", 
            "purple disk", 
            "orange disk", 
            "pink disk", 
            "wooden stick",
        ]
        
        phrase2object = {
            "wooden_stick": "peg",
        }
    elif domain_name == "cooking":
        text_phrases = [
            "carrot",
            "cucumber",
            "tomato",
            "round cutting board",
            "white bowl",
            "black countertop",
            "kitchen knife",
            "black robotic gripper",
        ]

        phrase2object = {
            "round_cutting_board": "cutting_board",
            "white_bowl": "bowl",
            "black_countertop": "counter",
            "kitchen_knife": "knife",
            "black_robotic_gripper": "bot",
        }

    text_query = "".join([
        phrase + " ." 
        for phrase in text_phrases
    ])

    token_spans = get_token_spans(text_query, text_phrases)

    return text_query, phrase2object, token_spans


def create_bbox_annotations(
    domain_name: str,
    boxes: List[np.array], 
    objects: List[str],
    phrases: List[str],
):
    ## cxcywh --> xyxy
    boxes_cxcywh = box_convert(
        boxes=boxes,
        in_fmt="xyxy",
        out_fmt="cxcywh",
    ).numpy()
    whs = boxes_cxcywh[:, 2:]

    bbox_anns = {}

    if domain_name == "blocksworld":
        for obj, box, phrase in zip(objects, boxes, phrases):
            bbox_anns[obj] = {
                "bbox": box.tolist(),
                "phrase": phrase,
            }

    elif domain_name == "hanoi":
        chunks = [
            [obj, box, box[2] - box[0], phrase]
            for obj, box, phrase in zip(objects, boxes, phrases)
        ]

        ## pegs
        object_counts = defaultdict(int)
        chunks = sorted(chunks, key=lambda x: x[1][0])

        # for pegs
        for obj, box, width, phrase in chunks:
            if obj != "peg":
                continue

            object_counts[obj] += 1
            bbox_anns[f"{obj}{object_counts[obj]}"] = {
                "bbox": box.tolist(),
                "phrase": phrase,
            }

        # for disks
        object_counts = defaultdict(int)
        chunks = sorted(chunks, key=lambda x: x[2])

        for obj, box, width, phrase in chunks:
            if obj == "peg":
                continue

            object_counts[obj] += 1
            bbox_anns[f"{obj}{object_counts[obj]}"] = {
                "bbox": box.tolist(),
                "phrase": phrase,
            }

    elif "cooking" in domain_name:
        object_counts = defaultdict(int)

        chunks = [
            [obj, box, phrase]
            for obj, box, phrase in zip(objects, boxes, phrases)
        ]
        chunks = sorted(chunks, key=lambda x: x[1][0])

        for obj, box, phrase in chunks:
            object_counts[obj] += 1

            if obj == "bot":
                if object_counts[obj] <= 2:
                    bot_id ="ab"[object_counts[obj]-1]
                    bbox_anns[f"{bot_id}_{obj}"] = {
                        "bbox": box.tolist(),
                        "phrase": phrase,
                    }
            else:
                if object_counts[obj] > 1:
                    bbox_anns[f"{obj}{object_counts[obj]}"] = {
                        "bbox": box.tolist(),
                        "phrase": phrase,
                    }
                else:
                    bbox_anns[f"{obj}"] = {
                        "bbox": box.tolist(),
                        "phrase": phrase,
                    }

    return bbox_anns


class PDDL:
    def __init__(
        self, 
        pddl_problem: str,
    ):
        self.pddl_problem = pddl_problem
        self.pddl_problem_flat = re.sub(
            r"\s+", " ", 
            pddl_problem.replace("\n", " "),
        )

        self.parse_objects()
        self.parse_initial_state()
        self.parse_goal_specification()

    # parse (:object * ) w/o newline
    def parse_objects(self):
        try:
            text = re.findall(
                r"\(:objects.*\(:init", 
                self.pddl_problem_flat,
            )[0].replace("(:init", "")

            text = text.replace("(:objects", "")
            text = text.replace(")", "")
            text = text.strip().rstrip()

            type_flag = False
            buff = []
            objects = []

            for x in text.split(" "):
                if type_flag:
                    for b in buff:
                        objects += [f"{b} - {x}"]

                    buff.clear()
                    type_flag = False
                elif x == "-":
                    type_flag = True
                else:
                    buff += [x]

            # in case types are not used
            if len(buff) > 0:
                for b in buff:
                    objects += [f"{b}"]

            pddl_objects = "(:objects\n"
            for o in objects:
                pddl_objects += f"    {o}\n"
            pddl_objects += ")"

            self.pddl_objects = pddl_objects
            self.objects = objects
        except Exception as e:
            #self.pddl_objects = None
            #self.objects = None
            self.pddl_objects = []
            self.objects = []

    # parse (:init * ) w/o newline
    def parse_initial_state(self):
        try:
            text = re.findall(
                r"\(:init.*\(:goal", 
                self.pddl_problem_flat,
            )[0].replace("(:goal", "")

            text = text.replace("(:init", "")
            text = text.replace("(", " ( ")
            text = text.replace(")", " ) ")
            text = re.sub(r"\s+", " ", text)
            text = text.strip().rstrip()

            buff = []
            count = 0

            conditions = []

            for x in text.split(" "):
                if x == "(":
                    count += 1
                elif x == ")":
                    if len(buff) > 0:
                        conditions += ["(" + " ".join(buff) + ")"]
                        buff.clear()

                    count -= 1
                else:
                    buff += [x]

                if count < 0:
                    break

            pddl_initial_state = "(:init\n"
            for i in conditions:
                pddl_initial_state += f"    {i}\n"
            pddl_initial_state += ")"

            self.pddl_initial_state = pddl_initial_state
            self.initial_conditions = conditions
        except Exception as e:
            #self.pddl_initial_state = None
            #self.initial_conditions = None
            self.pddl_initial_state = []
            self.initial_conditions = []

    # parse (:goal * )* w/o newline
    def parse_goal_specification(self):
        try:
            text = re.findall(
                r"\(:goal.*", 
                self.pddl_problem_flat,
            )[0]

            text = text.replace("(:goal", "")
            text = text.replace("(and", "", 1)
            text = text.replace("(", " ( ")
            text = text.replace(")", " ) ")
            text = re.sub(r"\s+", " ", text)
            text = text.strip().rstrip()

            buff = []
            count = 0

            conditions = []

            for x in text.split(" "):
                if x == "(":
                    count += 1
                elif x == ")":
                    if len(buff) > 0:
                        conditions += ["(" + " ".join(buff) + ")"]
                        buff.clear()

                    count -= 1
                else:
                    buff += [x]

                if count < 0:
                    break

            pddl_goal_specification = "(:goal (and \n"
            for g in conditions:
                pddl_goal_specification += f"    {g}\n"
            pddl_goal_specification += "))"

            self.pddl_goal_specification = pddl_goal_specification
            self.goal_conditions = conditions
        except Exception as e:
            #self.pddl_goal_specification = None
            #self.goal_conditions = None
            self.pddl_goal_specification = []
            self.goal_conditions = []
