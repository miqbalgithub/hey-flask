FROM python:3.6

COPY . /app/
WORKDIR /app
RUN chmod +x ./index.py

EXPOSE 3000
