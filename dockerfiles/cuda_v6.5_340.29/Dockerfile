FROM giffordlab/deepbind-docker:latest
MAINTAINER Matt Edwards <matted@mit.edu>

# From https://github.com/Kaixhin/dockerfiles/blob/master/cuda/cuda_v6.5/Dockerfile.

RUN cd /tmp && \
# Download run file
  wget http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_6.5.14_linux_64.run && \
# Make the run file executable and extract
  chmod +x cuda_*_linux_64.run && ./cuda_*_linux_64.run -extract=`pwd` && \
# Install CUDA drivers (silent, no kernel)
  ./NVIDIA-Linux-x86_64-*.run -s --no-kernel-module && \
# Install toolkit (silent)
  ./cuda-linux64-rel-*.run -noprompt && \
# Clean up
  rm -rf *

# (Re-)build the DeepBind binaries.
RUN make --directory /root/deepbind/libs/smat/src clean
RUN make --directory /root/deepbind/libs/smat/src
RUN make --directory /root/deepbind/libs/deepity/deepity_smat clean
RUN make --directory /root/deepbind/libs/deepity/deepity_smat
RUN make --directory /root/deepbind/libs/kangaroo/kangaroo_smat clean
RUN make --directory /root/deepbind/libs/kangaroo/kangaroo_smat
