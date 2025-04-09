@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service_status.bat zapret
echo:

set BIN=%~dp0bin\

start "zapret: wgonly" /min "%BIN%winws.exe" --wf-udp=53-65535 ^
--filter-udp=53-65535 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=12 --dpi-desync-fake-unknown-udp="%BIN%wireguard_initiation.bin"
