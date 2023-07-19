FROM deepview/linux-imx8:5.4.70
WORKDIR /work

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        gpg \
        curl
RUN curl https://deepviewml.com/apt/key.pub | gpg --dearmor -o /usr/share/keyrings/deepviewml.gpg
RUN echo 'deb [signed-by=/usr/share/keyrings/deepviewml.gpg] https://deepviewml.com/apt stable main' > /etc/apt/sources.list.d/deepviewml.list

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends \
        libnng-dev \
        ${EXTRA} \
        libvaal-dev \
        libvideostream-dev \
	python3 \
	deepview-rt-python \
	vaal-python \ 
    libgomp1

ENV VAAL_LIBRARY=/usr/lib/aarch64-linux-gnu/libvaal.so

