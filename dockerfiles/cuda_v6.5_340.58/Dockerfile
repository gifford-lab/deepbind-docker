FROM giffordlab/deepbind-docker:latest
MAINTAINER Matt Edwards <matted@mit.edu>

RUN cd /tmp && \
  wget http://us.download.nvidia.com/XFree86/Linux-x86_64/340.58/NVIDIA-Linux-x86_64-340.58.run && \
  chmod +x NVIDIA*.run && ./NVIDIA-Linux-x86_64-*.run -s --no-kernel-module
