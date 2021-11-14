FROM gnuradio-3.7-oshea-image

WORKDIR /anaconda
RUN curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh -o anaconda-installer.sh
RUN chmod +x anaconda-installer.sh
RUN ./anaconda-installer.sh -b
RUN eval "$(/root/anaconda3/bin/conda shell.bash hook)" && conda init
RUN eval "$(/root/anaconda3/bin/conda shell.bash hook)" && conda create -n py27 python=2.7
RUN bash -c 'eval "$(/root/anaconda3/bin/conda shell.bash hook)" && source activate py27 && conda install ipykernel'
RUN bash -c 'eval "$(/root/anaconda3/bin/conda shell.bash hook)" && python -m ipykernel install --user --name py27 --display-name "Python 2.7"'

#RUN apt install -y python3 python3-pip

# HUGE workaround to slam pip into this ancient ubuntu 16.04 image
#RUN curl https://bootstrap.pypa.io/pip/3.5/get-pip.py -o get-pip.py
#RUN python3 ./get-pip.py

# Gotta download a lib in order to build a wheel for notebook, SHEESH
#RUN apt install -y libffi-dev
#RUN pip install notebook

#RUN mkdir -p /home/steven && chmod 777 /home/steven
