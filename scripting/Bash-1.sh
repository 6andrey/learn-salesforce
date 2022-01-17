#! /bin/bash

# Test bash script

if [[ ! $1 ]]
    then
        echo "Error: missing paramter: directory"
        exit 1
fi

directory=$1
file_name=$2