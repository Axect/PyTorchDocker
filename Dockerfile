FROM pytorch/pytorch:latest
LABEL maintainer="Axect"
LABEL description="PyTorch Docker Image"
LABEL version="0.1"

# ==============================================================================
# Change Mirror to South Korea
# ==============================================================================
RUN sed -i 's@archive.ubuntu.com@mirror.kakao.com@g' /etc/apt/sources.list

# ==============================================================================
# Create user & Set permissions
# ==============================================================================
ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID rakhan
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID rakhan
RUN apt update && apt upgrade -y
RUN apt install -y sudo
RUN echo 'rakhan ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# ==============================================================================
# Change permission of /opt/conda to rakhan
# ==============================================================================
RUN chown -R rakhan:rakhan /opt/conda

USER rakhan
WORKDIR /home/rakhan

# ==============================================================================
# Build Essential
# ==============================================================================
RUN sudo apt install -y \
    build-essential \
    curl \
    git \
    wget \
    htop \
    jq \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libyaml-dev \
    software-properties-common \
    unzip \
    zlib1g-dev

# ==============================================================================
# Install Data Science Packages via conda
# ==============================================================================
RUN conda install -y numpy scipy pandas matplotlib scikit-learn scikit-image \
    seaborn pillow scikit-learn-intelex jupyter tqdm
RUN conda install -y -c conda-forge jupyterlab

# ==============================================================================
# Install ML Packages via conda
# ==============================================================================
# RUN conda install -y pytorch torchvision -c pytorch
RUN conda install -y -c conda-forge pytorch-lightning
RUN conda install -y -c fastchan fastai

