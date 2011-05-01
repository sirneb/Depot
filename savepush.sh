#!/bin/sh
git add .
git commit -a
git push unfuddle master
git push origin master
git push heroku master
