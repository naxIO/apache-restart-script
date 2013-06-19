apache-restart-script
=====================

A simple bash script to check a given website for a status and restart apache if needed.

status.sh will check if a given page that is delivered as a parameter to the script, has the status code 200 (OK) or 500.
In case of 500 it will restart the apache server.

This script is very basic and maybe not the highest sophisticated solution, but it works.


Add it to crontab and execute the status.sh script every minute.

    #
    # m h  dom mon dow   command
    * * * * * bash /opt/restartscript/status.sh http://www.website.com > /opt/restartscript/log 2>&1


