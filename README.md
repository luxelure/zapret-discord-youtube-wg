# Discord, YouTube, and WireGuard DPI circumvention tool for Windows
Based on [zapret-discord-youtube](https://github.com/Flowseal/zapret-discord-youtube) by [Flowseal](https://github.com/Flowseal)

### Launch options:
* `custom.bat` - custom strategy I created for personal use. Includes DPI circumvention for:
  * Discord;
  * YouTube;
  * Select CDN services (Cloudflare, Amazon CloudFront, Fastly);
  * Some Windscribe and Proton domains to make their VPN clients more snappier on launch;
  * WireGuard on ports 53, 80, 123, 443, from 500 to 8886 (Cloudflare WARP coverage), from 49152 to 65535 (dynamic coverage).
* `general.bat` - general strategy for Discord, YouTube, and Cloudflare (may be needed for Discord to function on some Russian ISPs).
* `discord.bat` - for Discord only (without Cloudflare).
* `service_install.bat` - to install any of the above strategies as a Windows service.
* `service_remove.bat` - to uninstall the service.
* `service_status.bat` - to check the service status.
* `wgonly.bat` - only for WireGuard on a 53-65535 port range (cannot be installed as a service).
