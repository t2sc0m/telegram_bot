#!/bin/bash

############################
##
## Telegram BOT Setup Script      
##      2015.12.31 by tescom
##
############################

cd /tmp

# 패키지 저장소 업데이트 및 필요 패키지 인스톨
sudo apt-get update
sudo apt-get install -y libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make git-core python2.7-dev libjansson-dev netcat

# telegram client 다운로드
git clone --recursive https://github.com/vysheng/tg.git && \

# telegram client 컴파일
cd tg && \
./configure && \
make && \

# 서버 모니터링 리소스 다운로드
git clone https://github.com/t2sc0m/telegram_bot.git bot

# 서버모니터링 실행 스크립트 카피
cp -vf /tmp/tg/bot/SHELL/tg.sh /tmp/tg/
sudo cp -vf /tmp/tg/bot/SHELL/telegramd /etc/init.d/

# log디렉토리 생성
mkdir -vp /tmp/tg/bot/logs

# 전화번호 인증
echo "----------------------------------"
echo "   전화번호 인증을 받아주세요.    "
echo "   인증 후 quit로 빠져나오세요.   "
echo "----------------------------------"
cd /tmp/tg
bin/telegram-cli -k server.pub

# BOT스크립트에 인증한 전화번호 등록
echo "------------------------------------------------------------"
echo "  인증한 전화번호를 스크립트에 등록 해 주세요.              "
echo "  cd /tmp/tg/bot                                            "
echo "  vi bot.lua                                                "
echo "  11: auth_phone  = { ["국가번호를포함한전화번호"] = true } "
echo "------------------------------------------------------------"

# BOT스크립트 실행안내
echo "----------------------------------"
echo "   실행은 sudo없이 실행 해주세요. "
echo "   $ /etc/init.d/telegramd start  "
echo "----------------------------------"
