## A collection of scripts related to android development and day to day life.
---

### Requirements
* Bash v4.4 and above
* Android Jellybean and above.
* Latest version of adb and fastboot installed properly and are in your **$PATH**.
* udev rules are properly set for your device/manufacturer.
ADB debugging enabled and your pc is trusted.
* Assumes that only one adb device is connected to the PC. Which holds true most of the time.
Its okay if you have multiple devices connected (including emulators),
but don't enable adb on multiple devices.
* Windows Subsystem for Linux is untested and unverified.
* *Note*:  Even though I have checked backup functions,
I have not verified the restore operations with backups created using this script.
- Have common sense.


# `phone-tool`
---
## A Simple helper script for adb functions.


### How to Use
* Make sure that script is executable.
* `chmod +x phone-tools` if necessary.
*  Make sure that your android device is connected and ADB is enabled.
* Simply run the script with `-h` flag `./phone-tools -h` to see options


 ```
 [-a  --apk]         [Batch install all the apk files found in current folder]
 [-ar --after-reboot][ PErform afer reboot items like connect to adb wireless, and enable brevent servers etc. Can be customized.]
 [-b  --backup]      [Backup app-data]
 [-br --brevent]     [Enable brevent Server on phone]
 [-cs --clear-sub]   [Clear Substratum App Data]
 [-i  --info]        [Check if device is connected & if yes, give its details]
 [-o  --ota]         [Sideload OTA ZIP and exit]
 [-p  --permissions] [Grant special permissions via adb for cetrain apps]
 [-r  --restore]     [Restore app data in .ab files in current folder]
 [-t  --theme]       [List Overlays and enter adb shell ode to choose overlays]
 [-w  --wireless]    [connect to adb wirelessly]
 [-we --wireless-enable] [Enable adb wireless on device]
 [-uo --unistall-overlays] [Un-Install system overlays for systemui, settings and core android packages]
 [-ut <theme name> ] [Uninstall theme]

 [-h --help]        [Display this message]
 [-v --version]     [Display script verion and exit]"
 ```
* Special Permissions include, BATTERY_STATS, DUMP, and WRITE_SECURE_SETTINGS, and are granted to following apps.

|App Name | Package Name |
|---| --- |
|Greenify | com.oasisfeng.greenify |
|Monochrome | com.suyashsrijan.lowbatterymonochrome |
|Wakelock Detector | com.uzumapps.wakelockdetector |
|Gsam Battery Monitor |com.gsamlabs.bbm |
|Gsam Battery Monitor (pro) | com.gsamlabs.bbm.pro |
|Better Battery Stats (xda) |com.asksven.betterbatterystats_xdaedition |
|Better Battery Stats (play store) | com.asksven.betterbatterystats |
|Force Doze | com.suyashsrijan.forcedoze |
|Nougat Quick settings | it.simonesestito.ntiles |
|System UI Tuner | xyz.paphonb.systemuituner |
|Naptime | com.franco.doze |
* You can customize by simply calling `set_permissions_cmd` from your function with right arguments mentioned in script.
* You need to manually accept the prompt on device and enter the encryption password if any for it to work. Certain apps might refuse to work with this"

### Changelogs

#### _v2.8_
- Option to Uninstall overlays by theme name
- fixed a bug where only one overlay was being un-installed

#### _v2.7_
- Added Ability to disable and unistall theme overlays for android Oreo (will not work on 7.1.2 or below versions)

#### _v2.6_
- ADB Wireless, Added more packages to permissions (Naptime and Quick settings)
- Added option to launch Brevent, Clear Substratum app data, enable adb wireless modes

#### _v2.5_
- Improved script, small bug fixes and better shellcheck (Still Printf varibles in quotes is ignored)

#### _v2.4_      
- Fixes  variables in device check function, Fix several typos.
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



#  `adb-screenshot`
A Simple bash script to take screenshots on connected android device using adb commands and saves them to $HOME/Phone/<script-name>output.
You can change the output directory and time using the options mentioned below.

### How to Use
* Make sure that script is executable.
* `chmod +x <script-name>` if necessary.
*  Make sure that your android device is connected and ADB is enabled.
* Simply run the script with `-h` flag for example `./phone-tools -h` to see options


 ```
 Usage: adb-screenshot [options]
 [-t --time <int> ]      [Time interval between screenshots]
 [-o --output <path> ]   [Output path (absolute)]
 [-c --count <int> ]     [Number of screenshots to be taken]
 [-h --help]             [Display this help message]
 [-v --version]          [Display version info]
 ```

 Running without any arguments will use following default values.
 * time interval between screenshots = 5 seconds
 * Path to Captured screenshots: S$HOME/Phone/Screenshots/screenshot-adb-outputs
 * Press Ctrl+C to stop the script. The script will wait for the device to be connected, and start as soon as it is available. When `-c` flag is not used script will continue indefinitely.
