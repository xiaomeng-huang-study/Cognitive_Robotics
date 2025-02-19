export domain="examples/blocksworld/domain.pddl"
export problem="targets/blocksworld/plain/problems/llama_3.2-vision/3/problem10.pddl"
python3 evaluation/planner.py ${domain} ${problem}