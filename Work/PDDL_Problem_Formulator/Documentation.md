# Generate Problem
```bash
export domain=blocksworld
export downward_dir=./downward
export data_dir=./data/temp/${domain}
export result_dir=./results/temp/${domain}
export num_repeat=1
export num_examples=10
export llm_model="Ollama"

python3 scripts/main.py \
    --domain_name ${domain} \
    --downward_dir ${downward_dir} \
    --data_dir ${data_dir} \
    --result_dir ${result_dir} \
    --num_repeat ${num_repeat} \
    --num_examples ${num_examples} \
    --gen_step "plain" \
    --llm_model ${llm_model} \
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