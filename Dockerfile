# FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
FROM pytorch/pytorch:latest
WORKDIR /app
RUN set -xe \
    && apt-get update \
    && apt-get install python3-pip -y
RUN apt-get install python3-pip -y
# Copy requirements
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt --no-cache-dir
RUN python3 -m pip install opencv-python
RUN python3 -m pip install onnxruntime
RUN apt-get install libgl1-mesa-glx -y
# RUN python3 -m pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu117
# RUN python3 -m pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu118
# RUN python3 -m pip install https://download.pytorch.org/whl/cu118/torch-2.0.0%2Bcu118-cp38-cp38-linux_x86_64.whl
# COPY torch-2.0.0+cu118-cp38-cp38-linux_x86_64.whl .
# RUN python3 -m pip install torch-2.0.0+cu118-cp38-cp38-linux_x86_64.whl
CMD ["python3", "inference_images.py", "--images-src", "/app/data/images_src/", "--images-bgr", "/app/data/images_bgr/", "--output-dir", "/app/data/images_dst/", "--model-type", "mattingbase", "--model-backbone", "resnet101", "--model-checkpoint", "/app/data/models/PyTorch/pytorch_resnet101.pth", "--output-types", "com", "pha", "fgr", "err", "--device", "cuda"]
# nvidia-smi
# CMD ["nvidia-smi"]
# infinity loop
# CMD tail -f /dev/null