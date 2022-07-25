FROM python:3.9.0

WORKDIR /home/

RUN echo '232233'

RUN git clone https://github.com/peakchang/testfa4.git

WORKDIR /home/testfa4

RUN pip install -r requirements.txt

EXPOSE 8080

#CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]

CMD ["gunicorn", "main:app", "--workers", "4", "--worker-class", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8080"]