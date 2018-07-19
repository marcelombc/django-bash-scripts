#!/usr/bin/env bash

if type pycodestyle > /dev/null 2>&1 ; then
    echo 'Linting python files'
    pycodestyle --exclude ENV,noc/settings.py .
else
    echo 'Pycodestyle is not installed.'
fi

if type ./node_modules/.bin/eslint > /dev/null 2>&1 ; then
    echo 'Linting javascript files'
    ./node_modules/.bin/eslint static/js/*.js
else
    echo 'Eslint is not installed.'
fi

