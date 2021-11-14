docker run \
-ti --rm --network=host \
--name gnuradio-cont \
-v /etc/passwd:/etc/passwd \
-v $(realpath ..):/work \
jupyter-gnuradio-3.7-oshea-image \
bash
