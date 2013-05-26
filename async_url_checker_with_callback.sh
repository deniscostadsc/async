#!/bin/bash

function url_checker {
    url=$1
    callback=$2
    result=$(curl -sL -w '%{http_code}' -o /dev/null  $url)

    $callback "$result" "$url"
}

function to_file {
    echo "$*" >> result_async_url_checker_with_callback.txt
}

rm result_async_url_checker_with_callback.txt 2> /dev/null

for url in $(cat urls.txt); do
    echo "verificando $url"   
    url_checker $url to_file &
done