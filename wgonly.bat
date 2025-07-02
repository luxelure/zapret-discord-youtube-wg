@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service_status.bat zapret
echo:

set "BIN=%~dp0bin\"

cd /d "%BIN%"

start "zapret: %~n0" /min "%BIN%winws.exe" --wf-udp=53-65535 ^
--filter-udp=53-65535 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-wireguard="%BIN%zero_32.bin"
