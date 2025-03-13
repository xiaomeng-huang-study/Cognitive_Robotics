# PDDL Problem Formulator 

## Description
In this work, a method is proposed to generate problem descriptions in the Planning Domain Definition Language (PDDL) specification using Large Language Models (LLMs), enabling an automated planner to perform task planning based on natural language instructions from the user and scene descriptions to facilitate robot execution.

## Requirements 
Packages: `numpy`, `torch`, `torchvision` 

## Preparation
- ``examples_dir`` in ``generate_problem.sh`` needs to be adjusted. This is where the examples for learning are stored. More examples can be added by imitation. 
- ``targets_dir`` in ``generate_problem.sh`` needs to be adjusted. This is where the task input and output are stored. 
- Model of LLMs (``llm_model`` in ``generate_problem.sh``) needs to be selected. 
  - If llama3.2 or llama3.2-vision is selected, then the ``API_URL_Ollama`` needs to be declared in the system environment, see [Rest API for Ollama](https://github.com/ollama/ollama?tab=readme-ov-file#rest-api) for technical details. 
  - If claude-3-5-sonnet-20240620 is selected, then the ``API_URL_Claude`` and ``API_KEY_Claude`` need to be declared in the system environment, see [Rest API for Claude](https://docs.anthropic.com/en/api/getting-started) for technical details. 
- ``num_repeat`` in ``generate_problem.sh`` is optional and represents the number of repetitions. 
- (``plain`` means that there's no reprompting.) 

## Usage
Run the script ``generate_problem.sh``. 

## Evaluation 
If the default Evaluation tool included here is used 
- Path of the problem file (``problem`` in ``evaluate.sh``) needs to be adjusted. 
- Run the script ``evaluate.sh``. 

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
