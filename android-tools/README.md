## A collection of scripts related to android development and day to day life.
---
### General  Requirements
* Bash v4.4 and above
* Android Jellybean and above.
* Latest version of adb and fastboot installed properly and are in your **$PATH**.
* udev rules are properly set for your device/manufacturer.
ADB debugging enabled and your pc is trusted.
* Assumes that only one adb device is connected to the PC. Which holds true most of the time.
Its okay if you have multiple devices connected (including emulators),
but don't enable adb on multiple devices.
* Windows Subsystem for Linux is untested and unverified.
- Have common sense.

##  adb-screenshot
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
