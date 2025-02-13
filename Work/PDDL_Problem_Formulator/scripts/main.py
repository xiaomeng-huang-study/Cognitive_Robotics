#!/usr/bin/env python

import os
import json
import time

from vilain import ViLaIn
from utils import seed_everything, parse_args, PDDL


def main():
    args = parse_args()
    domain_name = args.domain_name

    seed_everything(args.seed)
    
    task_names_examples = [
        fname.rsplit(".", 1)[0]
        for fname in os.listdir(f"{args.examples_dir}/problems")
    ]
    
    task_names_targets = [
        fname.rsplit(".", 1)[0]
        for fname in os.listdir(f"{args.targets_dir}/predicted_bboxes")
    ]
    
    vilain = ViLaIn(args)

    # generate PDDL problems
    if args.generate_problem:
        # start time stamp
        start_time = time.time()
        
        # create dirs 
        for dname in ("objects", "initial_states", "goal_specifications", "problems"):
            os.makedirs(
                f"{args.targets_dir}/{args.gen_step}/{dname}",
                exist_ok=True,
            )

        # Generate Examples
        all_examples = []
        
        for task_name in task_names_examples:
            pddl = PDDL(open(f"{args.examples_dir}/problems/{task_name}.pddl").read())
            annotated_bbox_anns = json.load(open(f"{args.examples_dir}/annotated_bboxes/{task_name}.json"))
            instruction = open(f"{args.examples_dir}/instructions/{task_name}.txt").read()
            
            all_examples += [{
                "problem": pddl.pddl_problem,
                "objects": pddl.pddl_objects,
                "initial_state": pddl.pddl_initial_state,
                "goal_specification": pddl.pddl_goal_specification,
                "bboxes": annotated_bbox_anns,
                "instruction": instruction,
            }]
        
        # Targets
        for task_name in task_names_targets:
            predicted_bbox_anns = json.load(open(f"{args.targets_dir}/predicted_bboxes/{task_name}.json"))
            instruction = open(f"{args.targets_dir}/instructions/{task_name}.txt").read()
            
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
                with open(f"{args.targets_dir}/{args.gen_step}/objects/{task_name}.pddl", "w") as fw:
                    fw.write(objects)
                
                # generate PDDL initial state
                initial_state = vilain.generate_problem(
                    target,
                    examples,
                    gen_type="initial_state",
                    domain_name=domain_name,
                )

                target["initial_state"] = initial_state
                with open(f"{args.targets_dir}/{args.gen_step}/initial_states/{task_name}.pddl", "w") as fw:
                    fw.write(initial_state)
                
                # generate PDDL goal_specification
                goal_specification = vilain.generate_problem(
                    target,
                    examples,
                    gen_type="goal_specification",
                    domain_name=domain_name,
                )

                target["goal_specification"] = goal_specification
                with open(f"{args.targets_dir}/{args.gen_step}/goal_specifications/{task_name}.pddl", "w") as fw:
                    fw.write(goal_specification)

                # concat all parts and generate problem
                problem = f"(define (problem {domain_name}) \n" + \
                            f"(:domain {domain_name}) \n" + \
                            f"{objects} \n" + \
                            f"{initial_state} \n" + \
                            f"{goal_specification} \n" + \
                            f")"

                with open(f"{args.targets_dir}/{args.gen_step}/problems/{task_name}.pddl", "w") as fw:
                    fw.write(problem)
                
        # end time stamp 
        end_time = time.time()
        print("It took", (end_time - start_time)*1000.0, "milliseconds for generating problems.")

    else:
        print("This framework can only deal with tasks for generating PDDL Problem formulations")


if __name__ == "__main__":
    main()


