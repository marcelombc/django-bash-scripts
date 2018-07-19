#!/usr/bin/env bash

if [ ! -d "ENV" ]; then
    echo 'No virtualenv found. Run init.sh under the scripts folder to setup project. Terminating...'
    return
else
    echo 'Start python virtualenv'
    source ENV/bin/activate
fi

echo 'Start local server on port 8000'
python manage.py runserver localhost:8000

