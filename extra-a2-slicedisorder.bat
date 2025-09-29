@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service_status.bat zapret
echo:

set "BIN=%~dp0bin\"
set "LISTS=%~dp0lists\"

cd /d "%BIN%"

start "zapret: %~n0" /min "%BIN%winws.exe" --wf-tcp=80,443 --wf-udp=53,80,123,443,500,1194,1701,2408,4500,4569,5060,50000-50099,51820,65142 ^
--filter-udp=53,80,123,443,1194,4569,5060,51820,65142 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=4 --dpi-desync-fake-wireguard="%BIN%quic_awg_prws.bin" --new ^
--filter-udp=500,1701,2408,4500 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=4 --dpi-desync-fake-wireguard="%BIN%quic_awg_warp.bin" --new ^
--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-fake-discord="%BIN%zero_1.bin" --dpi-desync-fake-discord="%BIN%zero_64.bin" --dpi-desync-fake-discord="%BIN%zero_64.bin" --dpi-desync-fake-discord="%BIN%zero_64.bin" --dpi-desync-fake-stun="%BIN%zero_1.bin" --dpi-desync-fake-stun="%BIN%zero_64.bin" --dpi-desync-fake-stun="%BIN%zero_64.bin" --dpi-desync-fake-stun="%BIN%zero_64.bin" --new ^
--filter-tcp=80 --ipset="%LISTS%ipset-cloudflare.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-udp=443 --ipset="%LISTS%ipset-cloudflare.txt" --dpi-desync=fake --dpi-desync-repeats=11 --new ^
--filter-tcp=443 --ipset="%LISTS%ipset-cloudflare.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,host+1,midsld-2,midsld,midsld+2,endhost-1,sniext+1 --dpi-desync-repeats=4 --dpi-desync-fooling=badseq,md5sig --dpi-desync-fake-tls="%BIN%zero_1.bin" --dpi-desync-fake-tls-mod=none --new ^
--filter-tcp=80 --hostlist="%LISTS%list-extra.txt" --hostlist="%LISTS%list-discord.txt" --hostlist="%LISTS%list-youtube.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-udp=443 --hostlist="%LISTS%list-extra.txt" --hostlist="%LISTS%list-discord.txt" --dpi-desync=fake --dpi-desync-repeats=11 --new ^
--filter-tcp=443 --hostlist="%LISTS%list-extra.txt" --hostlist="%LISTS%list-discord.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,host+1,midsld-2,midsld,midsld+2,endhost-1,sniext+1 --dpi-desync-repeats=4 --dpi-desync-fooling=badseq,md5sig --dpi-desync-fake-tls="%BIN%zero_1.bin" --dpi-desync-fake-tls-mod=none --new ^
--filter-udp=443 --hostlist="%LISTS%list-youtube.txt" --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-tcp=443 --hostlist="%LISTS%list-youtube.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,host+1,midsld-2,midsld,midsld+2,endhost-1,sniext+1 --dpi-desync-repeats=4 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%BIN%zero_1.bin" --dpi-desync-fake-tls-mod=none
