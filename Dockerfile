FROM python:3.9

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt update -y && apt install python3-pip git -y && pip3 install --no-cache-dir pipenv

ADD Pipfile Pipfile.lock /httpbin/
WORKDIR /httpbin
RUN /bin/bash -c "pip3 install --no-cache-dir -r <(pipenv lock -r)"

ADD . /httpbin
RUN pip3 install --no-cache-dir /httpbin

EXPOSE 443

CMD ["gunicorn", "-b", "0.0.0.0:443", "httpbin:app", "-k", "gevent", "--certfile", "./certs/fullchain.pem", "--keyfile", "./certs/privkey.pem"]
