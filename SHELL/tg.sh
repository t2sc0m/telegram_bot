#!/bin/bash

TGPATH="/tmp/tg"
TGBIN_PATH="/tmp/tg/bin"
TGBIN_NAME="telegram-cli"
TGBOT_PATH="/tmp/tg/bot/bot.lua"
TGLOG_PATH="/tmp/tg/bot/logs/telegram-cli.log"
TGLISTEN_PORT=8888


function ProcChk()
{
    local ProcFile="$1"
    local ProcName="$2"
    PID=`/bin/ps -e -u 0 | /bin/grep -w $ProcFile | /usr/bin/awk '{print $1}'`
    if [ "$PID" ] ;  then
        printf "%16s : [36m[1mRunning[0m\n" "$ProcName";
    else
        printf "%16s : [31m[1mStopped[0m\n" "$ProcName";
    fi;
}

case "$1" in
start)
    echo "[36m[1mStarting Telegram CLI Daemon...[0m"
    cd $TGPATH
    PID=`/bin/ps -e -u 0 | /bin/grep -w telegram-cli | awk '{print $1}'`

    if [ $PID ]; then
        echo "Telegram CLI Already Running"
        # exit 1
    else
        $TGBIN_PATH/$TGBIN_NAME -s $TGBOT_PATH -L$TGLOG_PATH -P $TGLISTEN_PORT -e "contact_list" -d &
        ProcChk "$TGBIN_NAME" "Telegram CLI Daemon"
    fi
    ;;
stop)
    echo "Telegram CLI safe stop Trying"
    `echo "safe_quit" | nc localhost 4500`

    PID=`/bin/ps -e -u 0 | /bin/grep -w telegram-cli | awk '{print $1}'`

    if [ -z $PID ]; then
        echo "Telegram CLI Already Stop"
        # exit 1
    else
        kill -9 $PID
    fi

    sleep 1
    ProcChk "$TGBIN_NAME" "Telegram CLI Daemon"
    ;;
status)
    ProcChk "$TGBIN_NAME" "Telegram CLI Daemon"
    ;;
*)
    echo "Usage : `basename $0` [ start | stop | status ]"
    ;;
esac
