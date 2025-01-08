sudo apt update
sudo apt install cmake g++ make python3 python3-dev libglu1-mesa-dev pciutils git -y

export ViLaIn_dir="/root/Cognitive_Robotics/ViLaIn/"
# for Downward
cd ${ViLaIn_dir}/downward
./build.py
cd ${ViLaIn_dir}

# for VAL
cd ${ViLaIn_dir}
VAL/scripts/linux/build_linux64.sh all Release
tar -xzvf VAL/build/linux64/Release/Val--Linux.tar.gz -C /usr/local --strip-components=1
cp ${ViLaIn_dir}/VAL/build/linux64/Release/bin/Validate ${ViLaIn_dir}/downward/
cd ${ViLaIn_dir}

# CUDA
export CUDA_HOME=/usr/local/cuda

# Grounding-DINO
cd ${ViLaIn_dir}/GroundingDINO/
pip install -e .
mkdir -p ${ViLaIn_dir}/GroundingDINO/weights
cd weights
wget -q https://github.com/IDEA-Research/GroundingDINO/releases/download/v0.1.0-alpha2/groundingdino_swinb_cogcoor.pth
cd ${ViLaIn_dir}

# Ollama
cd /tmp
curl -fsSL https://ollama.com/install.sh | sh
pip install ollama
ollama serve
ollama run llama3.2-vision
systemctl stop ollama.service
cd ${ViLaIn_dir}