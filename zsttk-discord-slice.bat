@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service_status.bat zapret
echo:

set "BIN=%~dp0bin\"
set "LISTS=%~dp0lists\"

start "zapret: zsttk-discord-slice" /min "%BIN%winws.exe" --wf-tcp=443 --wf-udp=53-65535 ^
--filter-udp=53-65535 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=11 --new ^
--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new ^
--filter-udp=443 --hostlist="%LISTS%list-discord.txt" --dpi-desync=fake,udplen --dpi-desync-repeats=11 --dpi-desync-udplen-increment=4 --dpi-desync-udplen-pattern=0x00242836 --new ^
--filter-tcp=443 --hostlist="%LISTS%list-discord.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,host+1,midsld-2,midsld,midsld+2,endhost-1,sniext+1 --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --dpi-desync-fake-tls=0x00
