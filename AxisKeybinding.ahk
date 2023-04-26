; Check the readme provided
; Good job for actually checking the script before you ran it +10 Points

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
SetWorkingDir %A_ScriptDir%
#include vjoy_lib.ahk
#MaxHotkeysPerInterval, 250
vjoy_id := 1
vjoy_init(vjoy_id)

;KeyboardHooks to record keypresses inside of Arma
#InstallKeybdHook
#UseHook On

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

x::
	SoundBeep
	; Raise from 50% to 100%
	val = 16383
	VJoy_SetAxis(val, vjoy_id, HID_USAGE_SL0)
	sleep, 500
	val = 32767
	VJoy_SetAxis(val, vjoy_id, HID_USAGE_SL0)
	sleep, 500

	; Lower from 50% to 0%
	val = 16383
	VJoy_SetAxis(val, vjoy_id, HID_USAGE_SL0)
	sleep, 500
	val = 0
	VJoy_SetAxis(val, vjoy_id, HID_USAGE_SL0)
	SoundBeep
	Return