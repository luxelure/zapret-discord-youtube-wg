@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service_status.bat zapret
echo:

set "BIN=%~dp0bin\"
set "LISTS=%~dp0lists\"

start "zapret: zsttk-extra-seqovl-multisplit" /min "%BIN%winws.exe" --wf-tcp=80,443 --wf-udp=53-65535 ^
--filter-udp=53-65535 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-repeats=11 --new ^
--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new ^
--filter-tcp=80 --ipset="%LISTS%ipset-cloudflare.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=80 --hostlist="%LISTS%list-extra.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=80 --hostlist="%LISTS%list-discord.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=80 --hostlist="%LISTS%list-youtube.txt" --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-udp=443 --ipset="%LISTS%ipset-cloudflare.txt" --dpi-desync=fake,udplen --dpi-desync-repeats=11 --dpi-desync-udplen-increment=4 --dpi-desync-udplen-pattern=0x00242836 --new ^
--filter-udp=443 --hostlist="%LISTS%list-extra.txt" --dpi-desync=fake,udplen --dpi-desync-repeats=11 --dpi-desync-udplen-increment=4 --dpi-desync-udplen-pattern=0x00242836 --new ^
--filter-udp=443 --hostlist="%LISTS%list-discord.txt" --dpi-desync=fake,udplen --dpi-desync-repeats=11 --dpi-desync-udplen-increment=4 --dpi-desync-udplen-pattern=0x00242836 --new ^
--filter-udp=443 --hostlist="%LISTS%list-youtube.txt" --dpi-desync=fake,udplen --dpi-desync-repeats=11 --dpi-desync-udplen-increment=4 --dpi-desync-udplen-pattern=0x00242836 --new ^
--filter-tcp=443 --ipset="%LISTS%ipset-cloudflare.txt" --dpi-desync=fake,multisplit --dpi-desync-split-pos=1,host+1,midsld-2,midsld,midsld+2,endhost-1,sniext+1 --dpi-desync-split-seqovl=681 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --dpi-desync-fake-tls=0x00 --new ^
--filter-tcp=443 --hostlist="%LISTS%list-extra.txt" --dpi-desync=fake,multisplit --dpi-desync-split-pos=1,host+1,midsld-2,midsld,midsld+2,endhost-1,sniext+1 --dpi-desync-split-seqovl=681 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --dpi-desync-fake-tls=0x00 --new ^
--filter-tcp=443 --hostlist="%LISTS%list-discord.txt" --dpi-desync=fake,multisplit --dpi-desync-split-pos=1,host+1,midsld-2,midsld,midsld+2,endhost-1,sniext+1 --dpi-desync-split-seqovl=681 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --dpi-desync-fake-tls=0x00 --new ^
--filter-tcp=443 --hostlist="%LISTS%list-youtube.txt" --dpi-desync=fake,multisplit --dpi-desync-split-pos=1,host+1,midsld-2,midsld,midsld+2,endhost-1,sniext+1 --dpi-desync-split-seqovl=681 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --dpi-desync-fake-tls=0x00
