#!/bin/sh
git add .
git commit -am "autosave $date master"
git push unfuddle master
git push origin master
git push heroku master
