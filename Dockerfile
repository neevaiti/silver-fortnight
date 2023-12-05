FROM python:3.9-slim

EXPOSE 8000

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

# COPY entrypoint.sh /code
COPY requirements.txt /code

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /code

RUN python project/manage.py migrate --no-input
RUN python project/manage.py collectstatic --no-input

#ENTRYPOINT ["sh", "entrypoint.sh"]

CMD ["gunicorn", "--chdir", "project", "--bind", "0.0.0.0:8000", "project.wsgi:application"]

# CMD bash -c "python project/manage.py makemigrations && python project/manage.py migrate && python project/manage.py runserver 0.0.0.0:80"