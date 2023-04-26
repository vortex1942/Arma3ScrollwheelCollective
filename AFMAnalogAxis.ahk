; Check the readme provided
; Also damned good job for actually checking the script before you ran it +10 Points


;;; Debugging
;;;#Warn
;;;If !(A_IsAdmin) {
;;;	Msgbox Script needs to be run with admin rights, press ok to run as admin instead.
;;;	Run *RunAs "%A_ScriptFullPath%"
;;;}

#NoEnv
SendMode InputThenPlay
#SingleInstance, force
#IfTimeout 100

; Loads vjoy_lib.ahk from the location of AFMAnalogAxis.ahk
SetWorkingDir %A_ScriptDir%
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

; Reload script : F1
F1::
	Reload
	SoundBeep
	Return

; Emergency script kill : Shift+F1
+F1::ExitApp  


;###################
;Slow traverse speed
;###################
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

;###################
;Fast traverse speed
;###################
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
