# Predict bounding boxes
```bash
export domain=blocksworld
export grounding_dino_dir=./GroundingDINO
export result_dir=./results/temp/${domain}
export data_dir=./data/temp/${domain}

python3 scripts/main.py \
    --domain_name ${domain} \
    --data_dir ${data_dir} \
    --result_dir ${result_dir} \
    --grounding_dino_dir ${grounding_dino_dir} \
    --predict_bboxes
```

# Generate Problem
```bash
export domain=blocksworld
export downward_dir=./downward
export data_dir=./data/temp/${domain}
export result_dir=./results/temp/${domain}
export num_repeat=1
export num_examples=5   # max 9

python3 scripts/main.py \
    --domain_name ${domain} \
    --downward_dir ${downward_dir} \
    --data_dir ${data_dir} \
    --result_dir ${result_dir} \
    --num_repeat ${num_repeat} \
    --num_examples ${num_examples} \
    --gen_step "plain" \
    --generate_problem
```

# Refine Problem
```bash
export domain=blocksworld
export data_dir=./data/temp/${domain}
export result_dir=./results/temp/${domain}

python3 scripts/main.py \
    --domain_name ${domain} \
    --data_dir ${data_dir} \
    --result_dir "${result_dir}" \
    --prev_gen_step "plain" \
    --gen_step "refine_once" \
    --refine_all \
    --refine_problem
```

# Find Plan
```bash
export domain=blocksworld
export downward_dir=./downward
export data_dir=./data/temp/${domain}
export result_dir=./results/temp/${domain}

python3 scripts/main.py \
    --domain_name ${domain} \
    --downward_dir ${downward_dir} \
    --data_dir ${data_dir} \
    --result_dir "${result_dir}" \
    --gen_step "refine_once" \
    --find_plan
```