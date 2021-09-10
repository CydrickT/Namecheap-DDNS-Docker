FROM alpine:latest

RUN apk update

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Install Namecheap-DDNS
ENV PYTHONPATH=/app
COPY Namecheap-DDNS /app
COPY Namecheap-DDNS.config /app
WORKDIR /app
RUN python -m pip install -r requirements.txt

# Running Namecheap-DDNS
CMD ["python", "/app/core/Application.py", "/app/Namecheap-DDNS.config"]
