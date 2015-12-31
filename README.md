# Telegram Server Monitoring BOT
---
## Telegram Client + BOT Script
![tescom](https://en.gravatar.com/userimage/96759029/aa4308f795041de37cc2fedf0d1071ca?size=128)
---
## Installation Guide
### Ubuntu
```shell
$ cd INSTALL
$ ./setup_for_ubuntu.sh
```
### CentOS
```shell
$ .....sorry 
```
---
## Directory Info
- /tmp/tg             : telegram client
- /tmp/tg/bot         : bot script
- /tmp/tg/bot/logs    : bot log 
- /tmp/tg/bot/SHELL   : execute scripts
- /tmp/tg/bot/INSTALL : install script  
  
---
## Usage
### Process Control
```shell
$ sudo /etc/init.d/telegramd {start|stop|restart|status}
```  
### Test
```shell
$ echo "msg 본인아이디 테스트메세지" | nc localhost 8888
```  
### 실전!!
#### 텔레그램 메신저에서 본인아이디와의 채팅창에서 명령어를 입력
```shell
help : 도움말 표시
쉘모드 : 설치한 서버에서 쉘 명령어가 실행 가능한 모드로 변경
쉘모드종료 : 위의 쉘모드를 종료
```
---
## Uninstall
```shell
$ cd /tmp/tg/bot/INSTALL
$ ./uninstall.sh
```
---

Ref. http://blog.acidpop.kr/
