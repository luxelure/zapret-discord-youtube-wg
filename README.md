# **zapret-discord-youtube-wg**
### What is this? 
**zapret-discord-youtube-wg** is a Discord, YouTube, and WireGuard DPI circumvention tool for Windows. 
Based on [zapret-discord-youtube](https://github.com/Flowseal/zapret-discord-youtube) by [Flowseal](https://github.com/Flowseal).

### Launch options:
* `general.bat` - for WireGuard, YouTube, and Discord.
* `extra.bat` - similar to general but with some miscellaneous sites added on top, inspect `list-extra.txt` to see them all.
* `global.bat` - will do its best at bypassing the DPI on all sites, without having to rely on the `list-extra.txt` hostlist. Cannot be installed as a service due to potential breakages it can cause in some games.
* `wgonly.bat` - only for WireGuard.
* `service_install.bat` - to install any of the above (except `global.bat`) as a Windows service.
* `service_remove.bat` - to uninstall the service.
* `service_status.bat` - to check the service status.

### Credits
* [bol-van](https://github.com/bol-van), creator of [zapret](https://github.com/bol-van/zapret).
* [Flowseal](https://github.com/Flowseal), creator of [zapret-discord-youtube](https://github.com/Flowseal/zapret-discord-youtube).
