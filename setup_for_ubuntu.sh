#!/bin/bash

cd /tmp

sudo apt-get update
sudo apt-get install -y libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make git-core python2.7-dev libjansson-dev 

git clone --recursive https://github.com/vysheng/tg.git && \
cd tg && \
./configure && \
make && \
git clone https://github.com/t2sc0m/telegram_bot.git bot

echo "---------------------------------------------------------"
echo "  다음 명령어를 실행한 후 전화번호 인증을 받아주세요."
echo " cd /tmp/tg"
echo " bin/telegram-cli -k server.pub"
echo "---------------------------------------------------------"
