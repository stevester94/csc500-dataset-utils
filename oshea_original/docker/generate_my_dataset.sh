docker run \
-ti --rm --network=host \
--name oshea-generator \
-v /etc/passwd:/etc/passwd \
-v /etc/group:/etc/group \
-u $(id -u):$(id -g) \
-v $(realpath ..):/work \
gnuradio-3.7-oshea-image \
bash -c "cd /work/dataset/ && ./generate_Oshea_Mackey_2021.py"
