FROM alpine:3.5
RUN apk add --update python py-pip
COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt
RUN yum install gcc -y
COPY api.py /src
COPY restmon /src/restmon
CMD python /src/api.py
