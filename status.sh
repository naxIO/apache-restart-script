#!/bin/bash

## ./site-status.sh http://www.mysite.com => To get the site status code and if 200, do nothing, else ./services-action.sh restart

if [ $# -lt 1 ]; then
        echo "Please enter the site you want to test"
        exit 1;
fi

responseline=`curl -sL -w "%{http_code} %{url_effective}\\n" "$1" -o /dev/null`

export IFS=" "

i=0;
for code in $responseline; do
        if [ $code == 200 ]; then
		echo "alles roger";
                exit 0;
        fi
        if [ $code == 500 ]; then
                services-action.sh restart apache2
        fi
        if [ $i == 0 ]; then
                break;
        fi
        i=$(expr $i + 1);
done
