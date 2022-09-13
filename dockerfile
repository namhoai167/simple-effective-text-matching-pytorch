FROM ubuntu:20.04LST
FROM pytorch/pytorch:1.8.2
WORKDIR /simple-effective-text-matching-pytorch
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev 

COPY . .
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt



CMD ["uvicorn", "api:api", "--proxy-headers", "--host", "0.0.0.0", "--port", "8000"]

