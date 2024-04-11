FROM python:3.10-alpine3.18

WORKDIR /app

COPY main.py .
COPY requirements.txt .

RUN python3.10 -m pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["python3.10", "main.py"]