#!/bin/bash
sudo docker run -it --rm --privileged \
    --device /dev/nvidiactl \
    --device /dev/nvidia-uvm \
    --device /dev/nvidia0 \
    --device /dev/nvidia1 \
    --device /dev/nvidia2 \
    matted/deepbind /bin/bash
