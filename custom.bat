@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service_status.bat zapret
echo:

set BIN=%~dp0bin\

start "zapret: custom" /min "%BIN%winws.exe" --wf-tcp=80,443 --wf-udp=53-65535 ^
--filter-udp=53-65535 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=12 --dpi-desync-fake-unknown-udp="%BIN%wireguard_initiation.bin" --new ^
--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake --new ^
--filter-tcp=80 --ipset="ipset-cdn.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=80 --hostlist="list-custom.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=80 --hostlist="list-discord.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=80 --hostlist="list-youtube.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-udp=443 --ipset="ipset-cdn.txt" --dpi-desync=fake --dpi-desync-repeats=11 --new ^
--filter-udp=443 --hostlist="list-custom.txt" --dpi-desync=fake --dpi-desync-repeats=11 --new ^
--filter-udp=443 --hostlist="list-discord.txt" --dpi-desync=fake --dpi-desync-repeats=11 --new ^
--filter-udp=443 --hostlist="list-youtube.txt" --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-tcp=443 --ipset="ipset-cdn.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --new ^
--filter-tcp=443 --hostlist="list-custom.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=11 --dpi-desync-fooling=badseq,md5sig --new ^
--filter-tcp=443 --hostlist="list-discord.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --new ^
--filter-tcp=443 --hostlist="list-youtube.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin" --dpi-desync-fake-tls-mod=rnd,dupsid
