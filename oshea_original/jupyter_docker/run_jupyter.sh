docker run \
-ti --rm --network=host \
--name gnuradio-cont \
-v /etc/passwd:/etc/passwd \
-v $(realpath ..):/work \
jupyter-gnuradio-3.7-oshea-image \
bash -c 'eval "$(/root/anaconda3/bin/conda shell.bash hook)" && jupyter notebook --allow-root --notebook-dir=/work'
#-u $(id -u):$(id -g) \
