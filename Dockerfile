FROM ubuntu:18.04
COPY . /app
WORKDIR /app
EXPOSE 5000
RUN apt-get update && apt-get install -y \
    python-dev \
    python-pip
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD [ "spottop.py" ]
