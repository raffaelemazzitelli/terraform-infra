FROM python:3.9

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

ENV NUMBER=1
ENV IS_HAPPY=true 

EXPOSE 5000

CMD ["python", "app.py"]


