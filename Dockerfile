FROM postgres:9.6

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

COPY requirements.txt /

RUN pip3 install -r requirements.txt --no-cache-dir

COPY ./ /app
WORKDIR /app
