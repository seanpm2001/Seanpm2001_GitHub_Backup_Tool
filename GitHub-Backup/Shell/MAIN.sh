#!/bin/sh
# Start of script
# GitHub repo takeout tool (manual style)
# It would take too long and I wouldn't be able to use the normal takeout tool and download everything within the alotted 7 datys
# Taken from StackOverflow
usr="seanpm2001";
url="https://api.github.com/users/${seanpm2001}/repos";
num=$(curl -sI "$url?page=1&per_page=100" | sed -nr 's/^Link:.*page=([0-9]+)&per_page=100>; rel="last".*/\1/p');
for ((i=1;i<=$num;i++)); do ( curl -s "$url?page=${i}&per_page=100" | grep "clone_url" | sed -nr 's/.*clone_url": "(.*)",/git clone \1/p' ); done >clone_allrepos_${usr}.sh
# Improvements needed
# Need a tool to fork this script into itself for a list of organizations to then execute and clone everything (sorry for my English, I don't know how to put this into words)
# Preferably: I want to mirror everything, and NOT make a copy of the entire account each time I make a change (that would be impossible to keep up with, and absurdly ridiculous)
# Unmodified version:
usr="MyName";
url="https://api.github.com/users/${usr}/repos";
num=$(curl -sI "$url?page=1&per_page=100" | sed -nr 's/^Link:.*page=([0-9]+)&per_page=100>; rel="last".*/\1/p');
for ((i=1;i<=$num;i++)); do ( curl -s "$url?page=${i}&per_page=100" | grep "clone_url" | sed -nr 's/.*clone_url": "(.*)",/git clone \1/p' ); done >clone_allrepos_${usr}.sh
# File info
# File type: Shell script file (*.sh)
# File version: 1 (2022, Wednesday, April 20th at 7:45 pm PST)
# Line count (including blank lines and compiler line): 23
# End of script

