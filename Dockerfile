FROM python:3.5
#无缓冲：用户层不提供缓冲，数据流直接到内核缓冲，再到磁盘等外设上。标准错误输出（2）通常是无缓存的，因为它必须尽快输出，且是输出到具有交互式的设备上，如屏幕，不是磁盘。
#行缓冲 、 全缓冲
ENV PYTHONUNBUFFERED 1

ADD ./requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 8000
RUN mkdir /web
WORKDIR /web