# AFMAnalogAxis.ahk
Creates an analog axis which is controlled via scrollwheel inputs
# SFMCollective&Trim
Adds a pitch trimmer function, requires X axis to be enabled.
Trim can be overruled with manual input.
An overlay appears while trim is enabled.
![image](https://github.com/vortex1942/Arma3ScrollwheelCollective/assets/22815407/42e5af8a-f7e3-44e2-b16b-12c9343604a7)


## Keybinds
```
Shift + Scroll Wheel : 5% Increments
Ctrl + Scroll Wheel  : 10% Increments
Shift + F1           : Close script
SFMCollective&Trim
Ctrl + Up Arrowkey   : Pitch Trim Up
Ctrl + Down Arrowkey : Pitch Trim Down
Ctrl + Left Arrowkey : Reset Collective
Ctrl + Right Arrowkey: Reset Trim
```

## Requirements
* vJoy atleast v2.1.8, Found here https://sourceforge.net/prohttps://www.autohotkey.com/jects/vjoystick/ or https://github.com/shauleiz/vJoy
* AutoHotkey atleast v1.1.36.02, Found here https://www.autohotkey.com/

## Installation
Download a release from here: https://github.com/vortex1942/Arma3ScrollwheelCollective/releases/tag/v1.0.0

1. Install AHK & VJOY
2. Open vJoyConf.exe and disable all tickboxes except "Slider
3. Run AxisKeybinding.ahk
    * When the X key is pressed this will cycle from 0% to 100% (Makes binding in Arma easier)
4. Inside arma select Collective Raise (Analog)
    * Press X Delete the keybinding ending in "1-"
5. Repeat with Collective Lower (Analog)
    * Delete the keybinding ending in "1+"
6. Press Shift+F1 to close the keybinding script
7. Start AFMAnalogAxis.ahk for standard usage
    * You will need to start this file everytime you wish to use this.

* SFMCollective&Trim.ahk requires X axis to be enabled
    
Video Guide found here: https://youtu.be/rebfSKC7Yck

## Credits

Vjoy_lib.ahk was sourced from here https://github.com/ahkscript/AHK-vJoy-Library/blob/master/VJoy_lib.ahk
