# Use Ubuntu as the base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y xfce4 xfce4-goodies tightvncserver wget && \
    apt-get clean

# Install Firefox as an example application
RUN apt-get update && \
    apt-get install -y firefox && \
    apt-get clean

# Set up the VNC server
RUN mkdir ~/.vnc

# Set a VNC password
RUN echo "YOUR_VNC_PASSWORD" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# Create a VNC startup script
RUN echo '#!/bin/bash\n' > ~/.vnc/xstartup
RUN echo 'xrdb $HOME/.Xresources' >> ~/.vnc/xstartup
RUN echo 'startxfce4 &' >> ~/.vnc/xstartup
RUN chmod +x ~/.vnc/xstartup

# Expose the VNC port
EXPOSE 5900

# Set the command to start the VNC server and keep the container running
CMD ["/bin/sh", "-c", "vncserver :1 -geometry 1280x800 -depth 24 && tail -f /dev/null"]

