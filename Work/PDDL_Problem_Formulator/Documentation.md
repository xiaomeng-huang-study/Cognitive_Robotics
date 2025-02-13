# Generate Problem
```bash
export domain=blocksworld
export examples_dir=./examples/${domain}
export targets_dir=./targets/${domain}
export llm_model="gemini-2.0-flash"
export gen_step="plain"
export num_repeat=1

python3 scripts/main.py \
    --domain_name ${domain} \
    --examples_dir ${examples_dir} \
    --targets_dir ${targets_dir} \
    --llm_model ${llm_model} \
    --gen_step ${gen_step} \
    --num_repeat ${num_repeat} \
    --generate_problem
```
