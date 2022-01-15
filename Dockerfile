FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

#for collectstatic
ENV DJANGO_SECRET_KEY=setforcollectstatic
ENV DJANGO_DEBUG=False
ENV DJANGO_ALLOWED_HOSTS=localhost

WORKDIR /code

COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system

COPY . /code/

#collecting for production
# RUN rm -rf staticfiles
# RUN python manage.py collectstatic 

