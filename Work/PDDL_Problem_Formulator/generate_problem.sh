export domain=blocksworld
export examples_dir=./examples/${domain}
export targets_dir=./targets/${domain}
export llm_model="claude-3-5-sonnet-20240620" # llama3.2, llama3.2-vision, claude-3-5-sonnet-20240620
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