# PyTorchDocker

## Usage

1. Clone the repository
```shell
git clone https://github.com/Axect/PyTorchDocker.git

# or

git clone git@github.com:Axect/PyTorchDocker.git
```

2. Build the image
```shell
cd PyTorchDocker
docker build -t axect/pytorchlab:latest \
    --build-arg USER_ID=$(id -u) \
    --build-arg GROUP_ID=$(id -g) .
```

3. Move to the preferred directory
```shell
cd <PREFERRED_DIRECTORY>
```

4. Run the container
```shell
docker run --net=host -itd \
    --mount "type=bind,source=$(pwd),dst=/home/quokka" \
    --workdir /home/quokka \
    --user quokka \
    --name pytorchlab \
    axect/pytorchlab:latest bash
```

5. Open VSCode

6. Click "Open a Remote Window" (You can find it at left-bottom)

7. Select "Attach to Running Container"

8. Select `pytorchlab`
