FROM alpine:3.5
RUN apk add --update python py-pip gcc linux-headers make musl-dev python-dev
COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt
COPY restmon/ /src
COPY restmon /src/restmon
CMD python /src/api.py
