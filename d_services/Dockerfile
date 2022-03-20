FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python3-pip
COPY . /app
WORKDIR /app/files
WORKDIR /app
RUN pip install -r /app/req.txt
ENTRYPOINT ["python3"]
CMD ["run_services.py"]