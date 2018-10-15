FROM python:3.6-alpine

EXPOSE 8888

ADD . /albert
WORKDIR /albert

RUN apk add make automake gcc g++ subversion python3-dev \
    && apk update && apk add py3-zmq build-base wget freetype-dev libpng-dev openblas-dev\
    && pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install -r requirements.txt

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--port", "8888", "--allow-root"]