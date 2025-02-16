
FROM python:3.12.7
LABEL authors="jusu-in"

# ensures that the python output
# i.e. the stdout and stderr streams are sent straight to terminal
ENV PYTHONUNBUFFERED 1

ARG DEV=false

COPY requirements.txt ./
COPY requirements.dev.txt ./
COPY django_celery /django_celery/

WORKDIR /.
RUN pip install -r requirements.txt

# install this only if it is dev mode
RUN if [ $DEV = true ]; then pip install -r requirements.dev.txt; fi

EXPOSE 8000

CMD ["gunicorn", "-b", "0.0.0.0:8000", "app.wsgi"]
