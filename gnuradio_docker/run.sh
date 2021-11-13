docker run \
-ti --rm --network=host \
--name gnuradio-cont \
-v /etc/passwd:/etc/passwd \
-u $(id -u):$(id -g) \
-v $(realpath ..):/work \
gnuradio-image \
jupyter-notebook --notebook-dir=/work
#bash
#jupyter-notebook --config="/workspace/jupyter_notebook_config.py"
#start.sh jupyter notebook --NotebookApp.token=''
