#!/bin/bash

function url_checker {
    url=$1
    result=$(curl -sL -w '%{http_code}' -o /dev/null  $url)

    echo "$result - $url" >> result_sync.txt
}

rm result_sync.txt 2> /dev/null

for url in $(cat urls.txt); do
    echo "verificando $url"
    url_checker $url
done