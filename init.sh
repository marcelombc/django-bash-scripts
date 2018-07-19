#!/usr/bin/env bash

function start_virtualenv {
    echo 'Start python virtualenv'
    source ENV/bin/activate
}

function install_packages {
    if [ $1 == "node" ]; then
        if [ -e package.json ]; then
            if type yarn > /dev/null 2>&1 ; then
                echo 'Install node modules'
                yarn install
            elif type npm > /dev/null 2>&1 ; then
                echo 'Install node modules'
                npm install
            else
                echo 'Yarn or NPM is not installed. Could not install node modules.'
            fi
        fi
    else
        if [ -e requirements.txt ]; then
            echo 'Install python packages'
            pip install -r requirements.txt
        fi
    fi
}

if type deactivate > /dev/null 2>&1 ; then
    echo 'Terminate python virtualenv'
    deactivate
fi

while [ ! $# -eq 0 ]
do
	case "$1" in
		--reset | -r)
			echo 'Cleaning project'
			. ./scripts/clean.sh
			;;
	esac
	shift
done

if [ ! -d "ENV" ]; then
    if ! type virtualenv > /dev/null 2>&1 ; then
        echo 'Python virtualenv is not installed. Terminating...'
        return
    fi
    echo 'Setting up a new python virtualenv'
    virtualenv -p python3 ENV
    start_virtualenv
    install_packages "python"
else
    start_virtualenv
fi

if [ ! -d "node_modules" ]; then
    install_packages "node"
fi

echo 'Setting up migrations'
python manage.py makemigrations
python manage.py migrate

. ./scripts/locale.sh

