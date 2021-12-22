; - Press Delete to start the script.
; - Press Home to pause and resume the script.
; - Press F1 to close the script altogether. You can also press Home to pause, then close AHK from the system tray.
; -----------------------------------------------------------------------------------------------------------------

	bindsPath := A_ScriptDir "\binds.txt"
	mainTarget := null
	Paused := 1
	FileRead, binds, binds.txt

#SingleInstance Force
#InstallKeybdHook
SendMode Input
DetectHiddenWindows, On

randomMini(min, max)
 {
   random, randomMini, min, max
   return randomMini
 }

pressLength := randomMini(25, 45)
SetKeyDelay , 50, %pressLength%,    ; 50ms is the default delay between presses, 30ms is the press length

if !A_IsAdmin {	
	MsgBox Please run as admin!
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

Gui, Font, s13 tBold
Gui, Add, Text , x+0 y+20 vInfo3, RedChair - FFXIV AFKer
Gui, Font, s8
Gui, Add, Text, vInfo4, Key Binds -----------------------------------------------------
Gui, Font, s18 tBold
;Gui, Add, Text, vInfo2, %binds%
Gui, Add, Edit, x16 y+10 w278 h200 vBindsEditor, %binds%
Gui, Font, s8 weight300
;Gui, Add, Button, x15 y+10 w280 h30 gOpenBinds , Open Binds
Gui, Add, Text, x17 y+0 vInfo, `nEdit binds in text box above (seperate with spaces)
Gui, Add, Button, x15 y+10 w280 h55 gSaveButton , Save and Reload
Gui, Add, Button, x15 y+1 w280 h25 gKeyListButton, View Key List
gui, add, text, x17 y+16 w278 h1 0x7 
Gui, Add, Text, vInfo5, Tab into game before running / stopping `n`n [Delete] Run / Stop   ---   [F1] Close   ---   [Home] Reload
;Gui, Add, Edit, vSearch1 w200, %binds%
;Gui, Add, Button, Default, Save
;Gui, Show, W300 Center, FFXIV AFKer

Gui, Show
return

;OpenBinds:
;{
;	Run Edit binds.txt, %A_ScriptDir%
;}

SaveButton:
{	
	Gui, Submit, NoHide
	MsgBox, 4, RedChair, Are you sure you want to save and reload?
	IfMsgBox, YES
	{
		FileDelete, %bindsPath%
		FileAppend, %BindsEditor%, %bindsPath%
		Reload
		return
	}
	else IfMsgBox NO
	return
}

KeyListButton:
{
	Run, https://tobu.co/redchair
	Return
}

Exit

Home::Reload
F1::ExitApp
GuiClose:
ExitApp


SetTitleMatchMode, 2
#IfWinActive, FINAL FANTASY XIV

statusReport(status) {
	ToolTip, RedChair - %status%, 0, 0
}



Delete::
	Pause, Toggle, 1
  	Paused := 1-Paused
	ID := WinExist("A")

  	If Paused {
    		statusReport("Stopped")
  	} Else {
    		statusReport("Running")

		Loop
		{
			;Random key press length between min and max
			pressLength := randomMini(25, 45) ;time in ms
			SetKeyDelay , 50, %pressLength%,
			
			;Find random key to press
			keyList := StrSplit(binds, A_Space)
			Random, ranKey, 1, keyList.MaxIndex()
			pressKey := keyList[ranKey]

			;Press the key then press again after 1 to 60 seconds then find new key after 5 to 550 seconds
			ControlSend, , %pressKey%, ahk_id %ID%
			Sleep, % ran(1, 60)
			ControlSend, , %pressKey%, ahk_id %ID%
			Sleep, % ran(5, 550)
		}
	}

return

ran(min, max)
 {
   random, ran, min * 1000, max * 1000
   return ran
 }
