# Ubuntu VNC container

## Build the Docker image
```
docker build -t ubuntu-vnc-containter .
```

## Run the Docker container
```
docker run -dt --rm --name ubuntu-vnc-container -p 5901:5901 ubuntu-vnc-container
```

## Connect to the VNC Server
You can now connect to the VNC server from your host machine using a VNC viewer.

- Open your VNC viewer.
- Connect to localhost:5901.
- Enter the password you set in the Dockerfile.

You should now see the XFCE desktop environment, where you can run GUI applications like Firefox

## Stop the Container
When you're done, stop and remove the container:
```
docker stop $(docker ps -q --filter "name=ubuntu-vnc-container")
docker rm $(docker ps -q --filter "name=ubuntu-vnc-container")
```
