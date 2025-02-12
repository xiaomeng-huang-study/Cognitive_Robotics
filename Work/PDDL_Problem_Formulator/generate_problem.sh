export domain=blocksworld
export downward_dir=./downward
export data_dir=./data/temp/${domain}
export result_dir=./results/temp/${domain}
export num_repeat=1
export num_examples=10
export llm_model="llama3.2" # llama3.2, llama3.1, llama3.2-vision, gemini-2.0-flash

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