#!/usr/bin/env python

import os
import json
import random
import time

from vilain import ViLaIn
from utils import seed_everything, parse_args, PDDL, get_error_meaning

NUM_TASKS = 20 # 10 training data + 1 test data


def main():
    args = parse_args()
    # domain_name = args.data_dir.split("/")[-1]
    domain_name = args.domain_name

    seed_everything(args.seed)

    vilain = ViLaIn(args)

    task_names = []
    for task_name_idx in range(1, NUM_TASKS + 1):
        task_names.append(f"problem{task_name_idx}")
    
    task_names_examples = task_names[0:10]
    task_names_targets = task_names[10:NUM_TASKS]

    # predict bboxes
    if args.predict_bboxes:
        # create directories
        for dname in ("predicted_bboxes", "annotated_bboxes"):
            os.makedirs(
                f"{args.result_dir}/{dname}",
                exist_ok=True,
            )

        for task_name in task_names_examples:
            image_path = f"{args.data_dir}/observations/{task_name}.jpg"

            # load annotated bboxes
            gt_bbox_anns = json.load(open(f"{args.data_dir}/annotated_bboxes/{task_name}.json"))

            # generate captions for annotated bboxes
            gt_bbox_anns = vilain.generate_captions(
                image_path,
                gt_bbox_anns,
            )
            
            json.dump(
                gt_bbox_anns,
                open(f"{args.result_dir}/annotated_bboxes/{task_name}.json", "w"),
            )
        
        for task_name in task_names_targets:
            image_path = f"{args.data_dir}/observations/{task_name}.jpg"

            # predict bboxes 
            predicted_bbox_anns = vilain.detect_objects(
                domain_name,
                image_path,
            )

            # generate captions for predicted bboxes
            predicted_bbox_anns = vilain.generate_captions(
                image_path,
                predicted_bbox_anns,
            )

            json.dump(
                predicted_bbox_anns,
                open(f"{args.result_dir}/predicted_bboxes/{task_name}.json", "w"),
            )

    # generate PDDL problems
    elif args.generate_problem:
        start_time = time.time()
        
        for dname in ("objects", "initial_states", "goal_specifications", "problems"):
            os.makedirs(
                f"{args.result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )

        all_examples = []
        all_targets = []
        
        # Generate Examples
        for task_name in task_names_examples:
            pddl = PDDL(open(f"{args.data_dir}/problems/{task_name}.pddl").read())
            annotated_bbox_anns = json.load(open(f"{args.result_dir}/annotated_bboxes/{task_name}.json"))
            instruction = open(f"{args.data_dir}/instructions/{task_name}.txt").read()
            
            all_examples += [{
                "problem": pddl.pddl_problem,
                "objects": pddl.pddl_objects,
                "initial_state": pddl.pddl_initial_state,
                "goal_specification": pddl.pddl_goal_specification,
                "bboxes": annotated_bbox_anns,
                "instruction": instruction,
            }]
        
        # --- Option 1:
        for task_name in task_names_targets:
            predicted_bbox_anns = json.load(open(f"{args.result_dir}/predicted_bboxes/{task_name}.json"))
            instruction = open(f"{args.data_dir}/instructions/{task_name}.txt").read()
            
            target = {
                "problem": None,
                "objects": None,
                "initial_state": None,
                "goal_specification": None,
                "bboxes": predicted_bbox_anns,
                "instruction": instruction,
            }
            
            examples = all_examples
            
            for repeat in range(args.num_repeat):
                # generate PDDL objects
                objects = vilain.generate_problem(
                    target,
                    examples,
                    gen_type="objects",
                    domain_name=domain_name,
                )
                
                target["objects"] = objects
                with open(f"{args.result_dir}/{args.gen_step}/objects/{task_name}.pddl", "w") as fw:
                    fw.write(objects)
                
                # generate PDDL initial state
                initial_state = vilain.generate_problem(
                    target,
                    examples,
                    gen_type="initial_state",
                    domain_name=domain_name,
                )

                target["initial_state"] = initial_state
                with open(f"{args.result_dir}/{args.gen_step}/initial_states/{task_name}.pddl", "w") as fw:
                    fw.write(initial_state)
                
                # generate PDDL goal_specification
                goal_specification = vilain.generate_problem(
                    target,
                    examples,
                    gen_type="goal_specification",
                    domain_name=domain_name,
                )

                target["goal_specification"] = goal_specification
                with open(f"{args.result_dir}/{args.gen_step}/goal_specifications/{task_name}.pddl", "w") as fw:
                    fw.write(goal_specification)

                # concat all parts and generate problem
                problem = f"(define (problem {domain_name}) \n" + \
                            f"(:domain {domain_name}) \n" + \
                            f"{objects} \n" + \
                            f"{initial_state} \n" + \
                            f"{goal_specification} \n" + \
                            f")"

                with open(f"{args.result_dir}/{args.gen_step}/problems/{task_name}.pddl", "w") as fw:
                    fw.write(problem)


        # --- Option 2:
        # # Generate Targets
        # for task_name in task_names_targets:
        #     predicted_bbox_anns = json.load(open(f"{args.result_dir}/predicted_bboxes/{task_name}.json"))
        #     instruction = open(f"{args.data_dir}/instructions/{task_name}.txt").read()
            
        #     all_targets += [{
        #         "problem": None,
        #         "objects": None,
        #         "initial_state": None,
        #         "goal_specification": None,
        #         "bboxes": predicted_bbox_anns,
        #         "instruction": instruction,
        #     }]

        # # Apply
        # for task_name_idx in range(0, NUM_TASKS):
        #     # select target
        #     target = all_targets[task_name_idx]

        #     # the example with same index will not be learned
        #     all_example_indices = list(range(NUM_TASKS))
        #     del all_example_indices[task_name_idx]

        #     for repeat in range(args.num_repeat):
        #         random.seed(repeat)
        #         assert args.num_examples <= len(all_example_indices), "Number of examples out of range!!!"
        #         example_indices = random.sample(all_example_indices, args.num_examples)

        #         examples = [
        #             all_examples[i]
        #             for i in example_indices
        #         ]

        #         # generate PDDL objects
        #         objects = vilain.generate_problem(
        #             target,
        #             examples,
        #             gen_type="objects",
        #             domain_name=domain_name,
        #         )

        #         target["objects"] = objects
        #         with open(f"{args.result_dir}/{args.gen_step}/objects/problem{task_name_idx+1}.pddl", "w") as fw:
        #             fw.write(objects)
                        
        #         # generate PDDL initial state
        #         initial_state = vilain.generate_problem(
        #             target,
        #             examples,
        #             gen_type="initial_state",
        #             domain_name=domain_name,
        #         )

        #         target["initial_state"] = initial_state
        #         with open(f"{args.result_dir}/{args.gen_step}/initial_states/problem{task_name_idx+1}.pddl", "w") as fw:
        #             fw.write(initial_state)

        #         # generate PDDL goal_specification
        #         goal_specification = vilain.generate_problem(
        #             target,
        #             examples,
        #             gen_type="goal_specification",
        #             domain_name=domain_name,
        #         )

        #         target["goal_specification"] = goal_specification
        #         with open(f"{args.result_dir}/{args.gen_step}/goal_specifications/problem{task_name_idx+1}.pddl", "w") as fw:
        #             fw.write(goal_specification)

        #         # concat all parts and generate problem
        #         problem = f"(define (problem {domain_name}) \n" + \
        #                   f"(:domain {domain_name}) \n" + \
        #                   f"{objects} \n" + \
        #                   f"{initial_state} \n" + \
        #                   f"{goal_specification} \n" + \
        #                   f")"

        #         with open(f"{args.result_dir}/{args.gen_step}/problems/problem{task_name_idx+1}.pddl", "w") as fw:
        #             fw.write(problem)

                # gen_idx += 1
                
        end_time = time.time()
        print("It took", (end_time - start_time)*1000.0, "milliseconds for generating problems.")

    # refine generated problems using corrective reprompting
    elif args.refine_problem:
        os.makedirs(
            f"{args.result_dir}/{args.gen_step}/problems",
            exist_ok=True,
        )

        all_examples = []
        all_targets = []

        # Examples
        for task_name in task_names_examples:
            pddl = PDDL(open(f"{args.data_dir}/problems/{task_name}.pddl").read())
            annotated_bbox_anns = json.load(open(f"{args.result_dir}/annotated_bboxes/{task_name}.json"))
            instruction = open(f"{args.data_dir}/instructions/{task_name}.txt").read()

            all_examples += [{
                "problem": pddl.pddl_problem,
                "bboxes": annotated_bbox_anns,
                "instruction": instruction,
            }]

        # Targets
        for task_name in task_names_targets:
        # num_problems = len(os.listdir(f"{args.result_dir}/{args.prev_gen_step}/problems"))
        # for gen_idx in range(1, num_problems+1):
            # task_idx = (gen_idx - 1) // args.num_repeat + 1

            pddl = PDDL(open(f"{args.result_dir}/{args.prev_gen_step}/problems/{task_name}.pddl").read())
            predicted_bbox_anns = json.load(open(f"{args.result_dir}/predicted_bboxes/{task_name}.json"))
            instruction = open(f"{args.data_dir}/instructions/{task_name}.txt").read()
            all_targets += [{
                "problem": pddl.pddl_problem,
                "bboxes": predicted_bbox_anns,
                "instruction": instruction,
            }]

        for task_name_idx in range(0, NUM_TASKS):
            # select target
            target = all_targets[task_name_idx]
            
            # the example with same index will not be learned
            all_example_indices = list(range(NUM_TASKS))
            del all_example_indices[task_name_idx]
            
            random.seed(task_name_idx)
            assert args.num_examples < len(all_example_indices), "Number of examples out of range!!!"
            example_indices = random.sample(all_example_indices, args.num_examples)

            examples = [
                all_examples[i]
                for i in example_indices
            ]

            error_path = f"{args.result_dir}/{args.prev_gen_step}/errors/problem{task_name_idx+1}.txt"

            if os.path.exists(error_path) or args.refine_all:
                if os.path.exists(error_path):
                    error_name, error_meaning = get_error_meaning(error_path)
                    error = (error_name, error_meaning)
                else:
                    error = None

                refined_problem = vilain.refine_problem(
                    target,
                    error,
                    examples,
                )
            else:
                refined_problem = target["problem"]

            with open(f"{args.result_dir}/{args.gen_step}/problems/problem{task_name_idx+1}.pddl", "w") as fw:
                fw.write(refined_problem)

    # find plan using fast-downward
    if args.find_plan:
        for dname in ("plans", "errors"):
            os.makedirs(
                f"{args.result_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )

        domain_path = f"{args.data_dir}/domain.pddl"
        num_problems = len(os.listdir(f"{args.result_dir}/{args.gen_step}/problems"))

        for gen_idx in range(1, num_problems+1):
            found, err = vilain.find_plan(
                domain_path,
                f"{args.result_dir}/{args.gen_step}/problems/problem{gen_idx}.pddl",
                f"{args.result_dir}/{args.gen_step}/plans/problem{gen_idx}",
            )

            if not found:
                with open(f"{args.result_dir}/{args.gen_step}/errors/problem{gen_idx}.txt", "w") as fw:
                    fw.write(err)


if __name__ == "__main__":
    main()


