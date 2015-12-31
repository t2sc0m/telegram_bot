#!/bin/bash

cd /tmp

sudo apt-get update
sudo apt-get install -y libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make git-core python2.7-dev libjansson-dev 

git clone --recursive https://github.com/vysheng/tg.git && \
cd tg && \
./configure && \
make && \
git clone https://github.com/t2sc0m/telegram_bot.git bot

cp -vf /tmp/tg/bot/SHELL/tg.sh /tmp/tg/
sudo cp -vf /tmp/tg/bot/SHELL/telegramd /etc/init.d/

echo "----------------------------------"
echo "   전화번호 인증을 받아주세요.    "
echo "   인증 후 quit로 빠져나오세요.   "
echo "----------------------------------"
cd /tmp/tg
bin/telegram-cli -k server.pub

echo "------------------------------------------------------------"
echo "  인증한 전화번호를 스크립트에 등록 해 주세요.              "
echo "  cd /tmp/tg/bot                                            "
echo "  vi bot.lua                                                "
echo "  11: auth_phone  = { ["국가번호를포함한전화번호"] = true } "
echo "------------------------------------------------------------"
