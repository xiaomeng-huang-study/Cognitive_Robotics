from typing import List
from collections import defaultdict
import os

import requests

class ViLaIn:
    def __init__(
        self,
        args,
    ):
        self.args = args

    # generate PDDL initial state or goal specification
    def generate_problem(
        self,
        target: dict,
        examples: List[dict],
        gen_type: str, # initial_state or goal_specification
        domain_name: str=None, # required for pddl object
    ):
        num_examples = len(examples)

        if gen_type == "objects":
            generated_pddl = "(:objects\n"

            if domain_name == "blocksworld":
                for obj in target["bboxes"].keys():
                    generated_pddl += f"\t{obj} - block\n"

                generated_pddl += f"\trobot - robot\n"

            elif domain_name == "hanoi":
                for obj in target["bboxes"].keys():
                    generated_pddl += f"\t{obj}\n"

            elif domain_name == "cooking":
                obj_dict = defaultdict(list)

                for obj in target["bboxes"].keys():
                    if obj.startswith("carrot") or \
                       obj.startswith("cucumber") or \
                       obj.startswith("tomato"):

                        obj_dict["vegetable"] += [obj]

                    elif obj.startswith("counter") or \
                         obj.startswith("cutting_board") or \
                         obj.startswith("bowl"):

                        obj_dict["location"] += [obj]

                    elif obj.startswith("knife"):
                        obj_dict["tool"] += [obj]

                    elif obj.endswith("bot"):
                        obj_dict["robot"] += [obj]

                for _type in ("vegetable", "location", "tool", "robot"):
                    objs = " ".join(obj_dict[_type])
                    generated_pddl += f"\t{objs} - {_type}\n"

            generated_pddl += ")"
                
        elif gen_type == "initial_state":
            prompt = f"Instruction: given objects, object labels, the bounding boxes of the objects, the captions of the objects, and the objects in PDDL, the goal is to write the initial state of the environment in PDDL. \n"
            prompt += f"\tWith the help of labels, you can differentiate between objects.\n"
            prompt += f"\tThe first number in bounding box represents the x-coordinate of the top-left vertex, the larger the value the closer it is to the right side of the screen, and the second number in bounding box represents the y-coordinate of the top-left vertex, the larger the value the closer it is to the bottom of the screen. The third number in bounding box represents the x-coordinate of the vertex in the lower right corner, the larger the value the closer to the right side of the screen, and the fourth number in bounding box represents the y-coordinate of the vertex in the lower right corner, the larger the value the closer to the bottom of the screen. With the help of these two vertices and their coordinates you should be able to understand their positions. \n"
            prompt += f"\tCaption is used to describe the object. \n"
            prompt += f"\tYou should learn how to create the mapping from object labels and bounding boxes to initial state of the environment in PDDL. \n"

            # Examples 
            prompt += f"Following are examples of references that can be used for imitation: \n"
            for i in range(num_examples):
                obj = examples[i]["objects"]
                bboxes = examples[i]["bboxes"]
                ini = examples[i]["initial_state"]
                
                prompt += f"Example {i}: \n"
                prompt += f"Q: \n"
                prompt += f"The objects in PDDL are: \n" + \
                          f"{obj}\n"
                
                prompt += f"The object labels, bounding boxes, and captions are: \n"

                for label in bboxes.keys():
                    x1, y1, x2, y2 = [int(x) for x in bboxes[label]["bbox"]]
                    cap = bboxes[label]["caption"]

                    prompt += f"label: {label}, bounding box: ({x1}, {y1}, {x2}, {y2}), caption: {cap}\n"

                prompt += f"Write the initial state in PDDL? A: \n" + \
                          f"{ini}\n"

            # Targets
            prompt += "Following are the tasks you need to handle: \n"

            obj = target["objects"]
            bboxes = target["bboxes"]

            prompt += f"Q: \n"
            prompt += f"The objects in PDDL are: \n" + \
                      f"{obj}\n"
                      
            prompt += f"The object labels, bounding boxes, and captions are: \n"

            for label in bboxes.keys():
                x1, y1, x2, y2 = [int(x) for x in bboxes[label]["bbox"]]
                cap = bboxes[label]["caption"]

                prompt += f"label: {label}, bounding box: ({x1}, {y1}, {x2}, {y2}), caption: {cap}\n"

            prompt += f"Write the initial state in PDDL? A: \n"
            prompt += f"(You only need to show a result, thinking processes or textual descriptions such as annotations need to be omitted. You can only answer in statements that conform to PDDL specifications.) \n"

        elif gen_type == "goal_specification":
            prompt = f"Instruction: given an instruction for the task, the objects in PDDL, and the initial state in PDDL, you need to write goal specification in PDDL. \n"
            
            # Examples 
            prompt += f"Following are examples of references that can be used for imitation: \n"
            
            for i in range(num_examples):
                inst = examples[i]["instruction"]
                obj = examples[i]["objects"]
                ini = examples[i]["initial_state"]
                goal = examples[i]["goal_specification"]
                
                prompt += f"Example {i}: \n"
                prompt += f"Q: \n"
                prompt += f"The instruction for the task is: \n" + \
                          f"{inst} \n"
                prompt += f"The objects in PDDL are: \n" + \
                          f"{obj} \n"
                prompt += f"The initial state in PDDL is: \n" + \
                          f"{ini} \n" 

                prompt += f"Write the goal specification in PDDL? A: \n" + \
                          f"{goal}\n"

            # Targets
            prompt += "Following are the tasks you need to handle: \n"
            
            inst = target["instruction"]
            obj = target["objects"]
            ini = target["initial_state"]

            prompt += f"Q: \n"
            prompt += f"The instruction for the task is: {inst} \n" + \
                      f"{inst} \n"
            prompt += f"The objects in PDDL are: \n" + \
                      f"{obj} \n"
            prompt += f"The initial state in PDDL is: \n" + \
                      f"{ini} \n" 

            prompt += f"Write the goal specification in PDDL? A: \n"
            prompt += f"(You only need to show a result, thinking processes or textual descriptions such as annotations need to be omitted. You can only answer in statements that conform to PDDL specifications.) "

        if gen_type in ("initial_state", "goal_specification"):
            if self.args.llm_model in ["llama3.2", "llama3.1", "llama3.2-vision"]:
                API_URL = os.environ["API_URL_Ollama"] # "http://localhost:11434/api/generate"
                
                headers = {'Content-Type': 'application/json'}
                
                payload = {
                    "model": self.args.llm_model,
                    "prompt": prompt,
                    "stream": False,
                    "options": {
                        "num_ctx": 8192,
                    }
                }
                
                try:
                    response = requests.post(API_URL, json=payload, headers=headers).json()
                except requests.exceptions.RequestException as e:
                    print(f"Error during request: {e}")
                except Exception as e:
                    print(f"An unexpected error occurred: {e}")
                
                generated_pddl = response['response']
            
            elif self.args.llm_model in ["claude-3-5-sonnet-20240620"]:
                API_URL = os.environ["API_URL_Claude"]
                
                API_KEY = os.environ["API_KEY_Claude"]
                
                payload = {
                    "model": self.args.llm_model,
                    "messages": [
                        {"role": "user", "content": prompt}
                    ],
                }
                
                headers = {
                    "Content-Type": "application/json",
                    "Authorization": f"Bearer {API_KEY}"
                }
                
                try:
                    response = requests.post(API_URL, json=payload, headers=headers).json()
                except requests.exceptions.RequestException as e:
                    print(f"Error during request: {e}")
                except Exception as e:
                    print(f"An unexpected error occurred: {e}")
                
                generated_pddl = response["choices"][0]["message"]["content"]
        
        return generated_pddl


