FROM nvidia/cuda:11.3.1-cudnn8-runtime-ubuntu20.04


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev


RUN pip3 install --upgrade pip

RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

RUN apt-get clean && rm -rf /var/lib/apt/lists/*


CMD ["python3", "-c", "import torch; print(torch.cuda.is_available())"]
