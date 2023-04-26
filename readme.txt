Goose's Analog Collective Controller!

*Always run AFMAnalogAxis.ahk
*Scripts can be killed by right clicking the AHK icon in your Windows tray.
*Try not to crash into other helis.

Keybinds:
Shift + Scroll Wheel : 5% Increments
Ctrl + Scroll Wheel  : 10% Increments
Shift + F1           : Close script

Requirements (Tested on Win10Pro):
vJoy (v2.1.8) Newer versions may work. https://sourceforge.net/projects/vjoystick/
AutoHotkey (Tested 1.1.36.02) New versions are OKAY Will prompt to install compatible version https://www.autohotkey.com/

*Installers are included, Ideally you should use fresh ones from their websites

############
Installation
############

2008 Era install tutorial: https://youtu.be/rebfSKC7Yck

1. Install AHK & VJOY
	* Default Options are fine
2. Open "C:\Program Files\vJoy\x64\vJoyConf.exe"
	a. Disable all tickboxes apart from "Slider"
	b. Select Apply
	c. Restart if prompted
	d. Close program
3. Run AxisKeybinding.ahk (Stop here if errors appear)
4. Inside Arma
	a. Options > Controls > Controller, Ensure vJoy Device is enabled if not select Refresh

	b. Controls > Helicopter > Collective Raise (Analog)
	c. Press X Delete the entry called "vJoy Device Stick Slider 1-"
	d. Controls > Helicopter > Collective Raise (Analog)
	e. Press X Delete the entry called "vJoy Device Stick Slider 1+"
		* Controller keybinding in arma is finnicky at best, You may need to disable any other controllers while doing this.
	f. Press Shift+F1 to Kill this script

5. Run AFMAnalogAxis.ahk for normal use



VJoy_lib.ahk was sourced from here https://github.com/ahkscript/AHK-vJoy-Library/blob/master/VJoy_lib.ahk