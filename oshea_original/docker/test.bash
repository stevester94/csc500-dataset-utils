docker run \
-ti --rm --network=host \
--name gnuradio-cont \
-v /etc/passwd:/etc/passwd \
-u $(id -u):$(id -g) \
-v $(realpath ..):/work \
gnuradio-3.7-image \
bash -c "cd /work/dataset/ && ./generate_RML2016.10a.py"
