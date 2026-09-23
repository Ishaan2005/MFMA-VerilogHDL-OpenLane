FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    make \
    cmake \
    verilator \
    gtkwave \
    python3 \
    python3-pip \
    python3-venv \
    iverilog \
    yosys \
    wget \
    curl \
    unzip \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel

RUN python3 -m pip install --no-cache-dir volare

RUN git clone --depth 1 \
    https://github.com/efabless/openlane2.git \
    /opt/openlane2

WORKDIR /opt/openlane2

RUN python3 -m pip install --no-cache-dir .

ENV PDK_ROOT=/pdks
ENV PDK=sky130A

RUN mkdir -p ${PDK_ROOT}

RUN volare fetch --pdk sky130 \
    && volare enable --pdk sky130

RUN ln -s $(volare path)/sky130A ${PDK_ROOT}/sky130A

WORKDIR /MAC-Unit-VerilogHDL-OpenLane

COPY . .

CMD ["/bin/bash"]
