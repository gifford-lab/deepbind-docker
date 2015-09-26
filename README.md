deepbind-docker
==============

This repository contains our slightly modified version of the
DeepBind code from the Frey lab.  There are patches to fix a few bugs
and a Dockerfile to package the code and some test data.

### Building the image

We have set up an automated build
[here](https://hub.docker.com/r/giffordlab/deepbind-docker/).  Pushes
should automatically trigger builds on the Docker hub.  If you want to
build a local image, you can run:

    docker build -t giffordlab/deepbind-docker .

### Getting the image

You can get the (public) automated image from any machine, including
EC2 ones, by running:

    docker pull giffordlab/deepbind-docker

Prerequisites are Docker and having the NVIDIA 346.46 driver installed
(see the upstream image documentation).  We should be able to switch
to CUDA 7.0 or 7.5 easily in the future, just by changing the first
line in the Dockerfile.

### Using the image

The image is based on this [CUDA
image](https://github.com/Kaixhin/dockerfiles/tree/master/cuda/cuda_v6.5).
To run an image with CUDA access, run (this is customized for our
machines with three GPUs):

    docker run -it --rm \
    --device /dev/nvidiactl \
    --device /dev/nvidia-uvm \
    --device /dev/nvidia0 \
    --device /dev/nvidia1 \
    --device /dev/nvidia2 \
    giffordlab/deepbind-docker

This will launch the ENCODE example script referred to in their documentation.

### Notes

The DeepBind pipeline currently has a nest of hardcoded paths for
loading data, but we will clean this up soon and add examples for
analyzing custom files with the container.

You can override the default `CMD` and then start other commands
manually:

    docker run -it --rm $NVIDIA_OPTS giffordlab/deepbind-docker /bin/bash

### License

The original code is copyright (c) 2015, Andrew Delong and Babak
Alipanahi, all rights reserved.  The following license agreement and
terms apply (see
[here](https://github.com/gifford-lab/deepbind-docker/blob/master/README.TXT)
for details):

 > Redistribution and use in source and binary forms, with or without
 > modification, are permitted provided that the following conditions
 > are met:
 >
 > 1. Redistributions of source code must retain the above copyright
 > notice, this list of conditions and the following disclaimer.
 >
 > 2. Redistributions in binary form must reproduce the above
 > copyright notice, this list of conditions and the following
 > disclaimer in the documentation and/or other materials provided
 > with the distribution.
 >
 > 3. Neither the name of the copyright holder nor the names of its
 > contributors may be used to endorse or promote products derived
 > from this software without specific prior written permission.
 >
 > THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 > "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 > LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 > FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 > COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 > INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 > (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 > SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 > HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 > STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 > ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 > OF THE POSSIBILITY OF SUCH DAMAGE.
