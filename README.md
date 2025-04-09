# **zapret-discord-youtube-wg**
### What is this? 
**zapret-discord-youtube-wg** is a Discord, YouTube, and WireGuard DPI circumvention tool for Windows. 
Based on [zapret-discord-youtube](https://github.com/Flowseal/zapret-discord-youtube) by [Flowseal](https://github.com/Flowseal).

### Launch options:
* `custom.bat` - a custom strategy, created for my personal use. Includes DPI circumvention for:
  * Discord;
  * YouTube;
  * Select CDN services (Cloudflare, Amazon CloudFront, Fastly);
  * Some Windscribe & Proton domains to make their VPN clients more snappier on launch, plus some miscellaneous sites, inspect `list-custom.txt` to see them all;
  * WireGuard on UDP 53-65535 port range.
* `general.bat` - a general strategy for WireGuard, Discord, YouTube, and Cloudflare (may be needed for Discord to function on some Russian ISPs).
* `global.bat` - a global strategy, will do its best to bypass the blocking on all sites, without having to rely on the `list-custom.txt` hostlist. Cannot be installed as a service due to potential breakages it can cause in some games.
* `discord.bat` - for WireGuard & Discord only (without Cloudflare).
* `wgonly.bat` - only for WireGuard on UDP 53-65535 port range.
* `service_install.bat` - to install any of the above (except `global.bat`) as a Windows service.
* `service_remove.bat` - to uninstall the service.
* `service_status.bat` - to check the service status.

### Credits
* [bol-van](https://github.com/bol-van), creator of [zapret](https://github.com/bol-van/zapret).
* [Flowseal](https://github.com/Flowseal), creator of [zapret-discord-youtube](https://github.com/Flowseal/zapret-discord-youtube).
