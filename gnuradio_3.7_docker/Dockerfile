FROM ubuntu:20.04

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update

RUN apt install -y git cmake g++ libboost-all-dev libgmp-dev swig python3-numpy \
python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev \
libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 \
liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins \
python3-zmq python3-scipy python3-gi python3-gi-cairo gir1.2-gtk-3.0 \
libcodec2-dev libgsm1-dev

RUN apt install -y pybind11-dev python3-matplotlib libsndfile1-dev

RUN apt install -y libiio-dev libad9361-dev libsoapysdr-dev soapysdr-tools

WORKDIR /build

# Build and install volk 2.4.1
# volk is failling 2 unit tests:
#   60 - qa_volk_32f_x2_dot_prod_16i (Failed)
#   128 - qa_volk_8ic_x2_multiply_conjugate_16ic (Failed)

RUN git clone --recursive https://github.com/gnuradio/volk.git && cd volk \
    && git checkout v2.4.1 && git submodule update --init --recursive \
    && mkdir build \
    && cd build && cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../ \
    && make -j8 && make install && ldconfig

RUN git clone https://github.com/gnuradio/gnuradio.git && cd gnuradio \
    && mkdir build && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../ \
    && make -j8 

# gnuradio fails "qa_qtgui"
RUN cd gnuradio/build && make install && ldconfig

# Install jupyter
RUN apt install -y python3 python3-pip
RUN pip install notebook easydict matplotlib scipy numpy sklearn mapper

RUN apt install -y vim libavcodec-dev libavformat-dev

RUN pip install cmappertools

RUN mkdir /home/steven && chmod 777 /home/steven
