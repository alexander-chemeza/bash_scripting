#!/bin/bash
#
# Create root_directory
echo "Enter root directory name:"
read root_directory
mkdir ./$root_directory
#
# Change directory
cd ./$root_directory

# Create virtual environment
python -m venv ./.venv

# Activate new virtual environment
source ./.venv/bin/activate

# Skip .venv folder in repository
echo ".venv/" > .gitignore

# Init git repository
git init

# Install django
pip install django

# Start new project
echo "Enter project name:"
read project_name
django-admin startproject $project_name

# Go to project directory
cd ./$project_name

while true; do
  read -p "Do you want to create app? (y/n) " yn
  case $yn in
    [yY] ) read -p "Enter app name: " app_name; python manage.py startapp $app_name;;
    [nN] ) break;;
    * ) echo "Invalid input"
  esac
done

# Migrate
python manage.py migrate

# Create superuser
python manage.py createsuperuser

# Run debug server
python manage.py runserver
