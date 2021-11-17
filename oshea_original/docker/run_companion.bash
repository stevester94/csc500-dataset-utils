docker run \
-ti --rm --network=host \
--name oshea-generator \
-v /etc/passwd:/etc/passwd \
-v /etc/shadow:/etc/shadow \
-v /etc/group:/etc/group \
-v /etc/sudoers:/etc/sudoers \
-u $(id -u):$(id -g) \
-v $(realpath ../../../csc500-examples/gnuradio_exploration/):/gnuradio_exploration \
-v $(realpath ../):/work \
-e DISPLAY \
-e QT_X11_NO_MITSHM=1 \
--userns=host --pid=host \
gnuradio-3.7-oshea-image \
gnuradio-companion
#$!
