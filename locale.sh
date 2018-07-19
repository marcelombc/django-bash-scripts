#!/usr/bin/env bash

echo 'Process and compile locales'
python manage.py makemessages -l de -l fr -l it -i 'ENV' -i 'node_modules' -i 'static/CACHE'
python manage.py makemessages -d djangojs -l de -l fr -l it -e js -i 'ENV' -i 'node_modules' -i 'static/CACHE'
python manage.py compilemessages -l de -l fr -l it

