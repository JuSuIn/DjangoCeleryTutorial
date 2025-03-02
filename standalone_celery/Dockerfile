FROM python:3.12.7



# ensures that the python output
# i.e. the stdout and stderr streams are sent straight to terminal
ENV PYTHONUNBUFFERED 1

ARG DEV=false

COPY requirements.txt /django_celery/requirements.txt
COPY . /django_celery/

WORKDIR /django_celery
RUN pip install -r requirements.txt

# Celery 실행
CMD ["celery", "-A", "django_celery", "worker"]