#!/bin/bash

known_hosts=~/.ssh/known_hosts

if [ -f "$known_hosts" ]; then
    echo "Deleting $known_hosts ..."
    rm $known_hosts
else
    echo "$known_hosts not found. Skipping..."
fi