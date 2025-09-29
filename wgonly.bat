@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service_status.bat zapret
echo:

set "BIN=%~dp0bin\"

cd /d "%BIN%"

start "zapret: %~n0" /min "%BIN%winws.exe" --wf-udp=53,80,123,443,500,1194,1701,2408,4500,4569,5060,51820,65142 ^
--filter-udp=53,80,123,443,1194,4569,5060,51820,65142 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=4 --dpi-desync-fake-wireguard="%BIN%quic_awg_prws.bin" --new ^
--filter-udp=500,1701,2408,4500 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=4 --dpi-desync-fake-wireguard="%BIN%quic_awg_warp.bin"
