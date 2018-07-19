#!/usr/bin/env bash

if type deactivate > /dev/null 2>&1 ; then
    echo 'Terminate python virtualenv'
    deactivate
fi

echo 'Deleting static CACHE folder'
rm -rf static/CACHE

echo 'Deleting ENV folder'
rm -rf ENV

echo 'Deleting node_modules folder'
rm -rf node_modules

echo 'Deleting *.pyc files'
find . -name \*.pyc -delete

