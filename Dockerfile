FROM python:3.10.13-slim

EXPOSE 8000

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt /code

RUN apt-get update
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /code

RUN python project/manage.py makemigrations --no-input
RUN python project/manage.py collectstatic --no-input


CMD ["gunicorn", "--chdir", "project", "--bind", "0.0.0.0:8000", "project.wsgi:application"]