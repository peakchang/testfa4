FROM python:3.9.0

WORKDIR /home/

RUN echo '23'

RUN git clone https://github.com/peakchang/testfa4.git

WORKDIR /home/testfa4

RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["bash", "-c", "gunicorn main:app --worker-class=uvicorn.workers.UvicornWorker --workers=5 --threads=3 --bind 0.0.0.0:8080 --daemon"]

CMD ["gunicorn", "--preload", "-c", "gunicorn.conf.py", "main:app"]

