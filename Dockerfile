FROM ubuntu:18.04
COPY . /app
WORKDIR /app
EXPOSE 5000
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev unclutter \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["spottop.py"]
