# A collection of startup scripts for Gnome Shell 3.24
---
This directory tree consists of startup items for gnome shell 3.24 to fix certain things of make life easier.

### Fix for Dropbox Appindicator on topbar/statusbar
---
* `appindicator-fix-startup-dropbox` fixes an issue where appindicator menus are not loaded or displayed properly in gnome shell 3.24.
* Please make the script executable and add it to list of startup items. Please make sure to **Disable** dropbox from startup and leave the script to handle the job.
* Please make sure that you have the necessary extension installed and enabled.
<https://extensions.gnome.org/extension/615/appindicator-support/>

### Fix for Volume extension conflict
---
* `fix-volume-extension-conflict` fixes an issue sound-output-device-chooser menus are not loaded or displayed properly in gnome shell 3.24. This is due to a conflict with volume mixer extension being loaded after sound-output-device-chooser extension.
* If Extension shell-volume-mixer@derhofbauer and sound-output-device-chooser@kgshank.net are enabled together.
This will result in incorrect order of loading extensions. First Sell volume mixer  which enables volumes more than 100%,
should be loaded and then the Sound output device chooser after the shell volume mixer is loaded. So to fix simply reload the Sound output chooser at session startup using this script.
* The script has an optional argument where in you can specify how much time (in seconds) it should wait before reloading the extension(useful during startup where you can wait few seconds to load all extensions). When not specifying any argument, the extension reloads immediately.
* Please make the script executable and add it to list of startup items.
* Please make sure that you have the necessary extensions installed and enabled.
https://extensions.gnome.org/extension/906/sound-output-device-chooser/
 https://extensions.gnome.org/extension/858/volume-mixer/
