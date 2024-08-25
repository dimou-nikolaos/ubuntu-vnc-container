# Ubuntu VNC container

## Build the Docker image
```
docker build -t ubuntu-vnc-containter .
```

## Run the Docker container
```
docker run -d -p 5901:5900 ubuntu-vnc
```

## Connect to the VNC Server
You can now connect to the VNC server from your host machine using a VNC viewer.

- Open your VNC viewer.
- Connect to localhost:5901.
- Enter the password you set in the Dockerfile.

You should now see the XFCE desktop environment, where you can run GUI applications like Firefox

## Optional: Persisting Data
If you want to persist data between container runs, you can mount a volume:
```
docker run -d -p 5901:5900 -v ~/vncdata:/root ubuntu-vnc-container
```
This mounts your local ~/vncdata directory to /root in the container, preserving any changes you make in the container.

## Stop the Container
When you're done, stop and remove the container:
```
docker stop <container_id>
docker rm <container_id>
```
Replace <container_id> with the actual container ID, which you can get using docker ps.
