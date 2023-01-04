FROM python:3.6

COPY . /app/
WORKDIR /app

RUN pip install -r requirements.txt
#RUN chmod +x ./app.py

#EXPOSE 3000
ENTRYPOINT ["python"]
CMD ["app.py"]

ENTRYPOINT ["python"]
CMD ["app.py"]