# Analog Collective Controller
Creates an analog axis which is controlled via scrollwheel inputs

## Keybinds
```
Shift + Scroll Wheel : 5% Increments
Ctrl + Scroll Wheel  : 10% Increments
Shift + F1           : Close script
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
    
Video Guide found here: https://youtu.be/rebfSKC7Yck

## Credits

Vjoy_lib.ahk was sourced from here https://github.com/ahkscript/AHK-vJoy-Library/blob/master/VJoy_lib.ahk
