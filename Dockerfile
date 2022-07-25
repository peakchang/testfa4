FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/peakchang/test_fa1.git

WORKDIR /home/test_fa1

RUN pip install -r requirements.txt

EXPOSE 8080

#CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]

CMD ["gunicorn", "main:app", "--workers", "4", "--worker-class", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8080"]