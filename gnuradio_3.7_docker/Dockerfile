FROM ubuntu:18.04

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update

RUN apt install -y gnuradio gnuradio-dev

RUN apt install -y python-pip
RUN pip2 install mapper

##############################################
# Build OShea's mediatools repo and install
##############################################
WORKDIR /build

# I'm sure it's overkill but we're using all the suggested tools from gnuradio
RUN apt install -y cmake git g++ libboost-all-dev python-dev python-mako \
python-numpy python-wxgtk3.0 python-sphinx python-cheetah swig libzmq3-dev \
libfftw3-dev libgsl-dev libcppunit-dev doxygen libcomedi-dev libqt4-opengl-dev \
python-qt4 libqwt-dev libsdl1.2-dev libusb-1.0-0-dev python-gtk2 python-lxml \
pkg-config python-sip-dev 

RUN git clone https://github.com/osh/gr-mediatools.git && cd gr-mediatools && mkdir build && cd build \
    && cmake ../
RUN cd gr-mediatools/build && make -j8
