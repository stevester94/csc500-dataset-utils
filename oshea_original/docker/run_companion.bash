docker run \
-ti --rm --network=host \
--name oshea-generator \
-v /etc/passwd:/etc/passwd \
-u $(id -u):$(id -g) \
-v $(realpath ..):/work \
-e DISPLAY \
gnuradio-3.7-oshea-image \
bash
