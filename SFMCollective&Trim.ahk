; Check the readme provided
; Also damned good job for actually checking the script before you ran it +10 Points


; Debugging
;#Warn
;If !(A_IsAdmin) {
;	Msgbox Script needs to be run with admin rights, press ok to run as admin instead.
;	Run *RunAs "%A_ScriptFullPath%"
;KeyboardHooks to record keypresses inside of Arma
;#InstallKeybdHook
;#UseHook On
;;;}

#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, ToolTip, Screen
SendMode InputThenPlay
#SingleInstance, force
#IfTimeout 100

; Loads vjoy_lib.ahk from the location of AFMAnalogAxis.ahk
#include vjoy_lib.ahk

; A warning will appear if this is set too low
; May need to be raised if your mouse is able to scroll quickly
#MaxHotkeysPerInterval, 250

; Set the vjoy device id (Controller ID)
; Leave default unless 
vjoy_id := 1

; Init the vJoy stick
vjoy_init(vjoy_id)

; Check SL0 axis exists on stick
if (!VJoy_GetAxisExist_SL0(vjoy_id)){
	msgbox Please enable the SL0 axis of vjoy ID %vjoy_id% using the vJoy config utility.
}
; Check X axis exists on stick
if (!VJoy_GetAxisExist_X(vjoy_id)){
	msgbox Please enable the X axis of vjoy ID %vjoy_id% using the vJoy config utility.
}

CreateGUI() {
	Gui +E0x20 -Caption +LastFound +ToolWindow +AlwaysOnTop +E0x08000000 ; Extra options prevent overlay from taking focus
	
	WinSet, Transparent, 100
	Gui, Font, s15 W700, Verdana
	Gui, Add, Text, x5 y8  cRed, TRIM ; How the hell do I center this?

	Gui, Color, 202020 ; background color
	Gui, Show, x0 y0 W70 H35, Overlay ; background box

	; Position the GUI in the top center of the screen
	Gui, +LastFound
	WinGetPos, , , WinWidth, _
	WinGetPos, WinX, WinY, , _
	NewX := (A_ScreenWidth - WinWidth) / 2
	NewY := WinY - 10
	Gui, Show, x%NewX% y%NewY%, Overlay
	return
	}

CreateGUI() 
Gui, Hide


; init values & center sticks
xval = 16383.5
val = 16383.5
VJoy_SetAxis_X(16383.5, vjoy_id)
VJoy_SetAxis_SL0(16383.5, vjoy_id)

; Reload script : F1
F1::
	Reload
	SoundBeep
	Return

; Emergency script kill : Shift+F1
+F1::ExitApp  

; Reset Trim Ctrl+Right Arrow
 ^Right::
 	xval = 16383.5
	VJoy_SetAxis_X(16383.5, vjoy_id)
	Gui, Hide
	return

; Reset Throttle Ctrl+Left Arrow
 ^Left::
 	val = 16383.5
	VJoy_SetAxis_SL0(16383.5, vjoy_id)
	return

;########################
;Slow collective traverse
;########################
; Shift + Wheel = 5%
+WheelUp::
	; Pick a number between 0 and 32767 and store it in val
	val += 1638.25 ;This will set the traverse speed
	IfLess val,0, SetEnv val,0
	IfGreater val,32767, SetEnv val,32767
	; Set axis value
	VJoy_SetAxis(val, vjoy_id, HID_USAGE_SL0)
	return

+WheelDown::
	; Pick a number between 0 and 32767 and store it in val
	val -= 1638.25 ;This will set the traverse speed
	IfLess val,0, SetEnv val,0
	IfGreater val,32767, SetEnv val,32767
	; Set axis value
	VJoy_SetAxis(val, vjoy_id, HID_USAGE_SL0)
	return

;########################
;Slow collective traverse
;########################
;Ctrl + Wheel = 10% x 1% Multiplier
^WheelUp::
	val += 3276.7 ;This will set the traverse speed
	; Set axis value
	IfLess val,0, SetEnv val,0
	IfGreater val,32767, SetEnv val,32767

	VJoy_SetAxis(val, vjoy_id, HID_USAGE_SL0)
	return

^WheelDown::
	val -= 3276.7 ;This will set the traverse speed
	; Set axis value
	IfLess val,0, SetEnv val,0
	IfGreater val,32767, SetEnv val,32767

	VJoy_SetAxis(val, vjoy_id, HID_USAGE_SL0)
	return


;###################
; PITCH TRIMMER
;###################
; Shift + Arrow Up/Down

xint = 511
^Up::
	xval += 511 ;This will set the traverse speed
	
	;Min/Max limiters
	IfLess xval,8703, SetEnv xval,8703
	IfGreater xval,24063, SetEnv xval,24063	
	
	if (xval == 16383.5) {	; Hide GUI if balanced
	Gui, Hide
	} else { ; This could be more efficient
		Gui, Show, NA
	}
	; Set axis value
	VJoy_SetAxis_X(xval, vjoy_id)
	return

^Down::
	xval -= 511 ;This will set the traverse speed

	;Min/Max limiters
	IfLess xval,8703, SetEnv xval,8703
	IfGreater xval,24063, SetEnv xval,24063

	if (xval == 16383.5) { ; Hide GUI if balanced
	Gui, Hide
	} else {
		Gui, Show, NA
	}

	; Set axis value
	VJoy_SetAxis_X(xval, vjoy_id)
	return



