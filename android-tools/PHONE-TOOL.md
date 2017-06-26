## A Simple helper script to install, backup, restore android apps/appdata.
---
### Requirements
* Bash v4.4 and above
* Android Jellybean and above.
* Latest version of adb and fastboot installed properly and are in your **$PATH**.
* udev rules are properly set for your device/manufacturer.
ADB debugging enabled and your pc is trusted.
* Assumes that only one adb device is connected to the PC. Which holds true most of the time.
Its okay if you have multiple devices connected (including emulators),
but don't enable adb on multiple devicees.
* Windows Subsystem for Linux is untested and un-verified.
* *Note*:  Even though I have checked backup functions,
I have not verified the restore operations with backups created using this script.
- Have common sense.

### How to Use
* Make sure that script is executable.
* `chmod +x phone-tools` if necessary.
*  Make sure that your android device is connected and ADB is enabled.
* Simply run the script with `-h` flag `./phone-tools -h` to see options


 ```
 [-a --apk]         [Batch install all the apk files found in current folder]
 [-i --info]        [Check if Device is connected and if yes, give its details and exit]
 [-p --permissions] [Grant special permissions via adb for cetrain apps]
 [-r --restore]     [Restore app data in .ab files in current folder]
 [-b --backup]      [Backup app-data]
 [-o --ota]         [Sideload OTA ZIP and exit]
 [-h --help]        [Display this message]
 [-v --version]     [Display script verion and exit]
 ```
* Special Permissions include, BATTERY_STATS, DUMP, and WRITE_SECURE_SETTINGS, and are granted to following apps.
<pre>
GREENIFY com.oasisfeng.greenify
MONOCHROME com.suyashsrijan.lowbatterymonochrome
WAKELOCK DETECTOR com.uzumapps.wakelockdetector
GSAM BATTERY com.gsamlabs.bbm
GSAM_BATTERY_PRO=com.gsamlabs.bbm.pro
BETTER BATTERY STATS com.asksven.betterbatterystats_xdaedition
BETTER BATTERY STATS_NXDA com.asksven.betterbatterystats
FORCE DOZE com.suyashsrijan.forcedoze
SYSTEMUI TUNER xyz.paphonb.systemuituner</pre>
* You can customize by simply calling `set_permissions_cmd` from your function with right arguments mentioned in script.
* You need to manually accept the prompt on device and enter the encryption password if any for it to work. Certain apps might refuse to work with this"

### Change-logs

#### _v2.4_      
- Fixs  variables in device check function, Fix several typos.
- Added betterbatterystats playstore edition
- Ability to see version info for script. {Just to keep track of it}

##### _v2.3_      
- Simplified and streamlined granting permissions by modifying set_permissions_cmd,
to perform app checks and removed redundant functions.

#### _v2.1_      
- Backup and restore functions, Wait for device to be connected if its not connected.

##### _v2.0_     
- Major rewrite, Command line arguments, check device connections, modularize components.

#### _v1.0_      
- Batch install, grant permissions
