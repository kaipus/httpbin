#!/usr/bin/env bash
export FLASK_APP=httpbin
export FLASK_ENV=development
#export FLASK_RUN_PORT=5050
#flask run --host=0.0.0.0
#gunicorn -w 4 httpbin:app -b 0.0.0.0:5050 -k gevent
gunicorn -w 4 httpbin:app -b 0.0.0.0:5050 --certfile ./certs/fullchain.pem --keyfile ./certs/privkey.pem
