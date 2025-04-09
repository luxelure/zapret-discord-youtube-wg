@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service_status.bat zapret
echo:

set BIN=%~dp0bin\

start "zapret: discord" /min "%BIN%winws.exe" --wf-tcp=443 --wf-udp=53-65535 ^
--filter-udp=53-65535 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=12 --dpi-desync-fake-unknown-udp="%BIN%wireguard_initiation.bin" --new ^
--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake --new ^
--filter-udp=443 --hostlist="list-discord.txt" --dpi-desync=fake --dpi-desync-repeats=11 --new ^
--filter-tcp=443 --hostlist="list-discord.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=8 --dpi-desync-fooling=md5sig,badseq
