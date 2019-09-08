#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#Include <winapi.au3>
#include <windowsconstants.au3>

If $CmdLine[0] == 2 Then
   If $CmdLine[1] == 'FIXFINDPATH' Then
	  WinActivate($CmdLine[2])
	  Sleep(100)
	  Send("{S DOWN}")
	  Send("{SPACE DOWN}")
	  Sleep(600)
	  Send("{S UP}")
	  Send("{SPACE UP}")

	  Send("{D DOWN}")
	  Send("{SPACE DOWN}")
	  Sleep(600)
	  Send("{D UP}")
	  Send("{SPACE UP}")

	  Send("{W DOWN}")
	  Send("{SPACE DOWN}")
	  Sleep(600)
	  Send("{W UP}")
	  Send("{SPACE UP}")

	  Send("{A DOWN}")
	  Send("{SPACE DOWN}")
	  Sleep(600)
	  Send("{A UP}")
	  Send("{SPACE UP}")

	  Sleep(600)

	  Send("{CTRLDOWN}")
	  Send("{S down}")
	  Sleep(700)
	  Send("{S up}")
	  Send("{CTRLUP}")
   EndIf
ElseIf $CmdLine[0] == 1 Then
   If $CmdLine[1] == "MOUSEDOWN" Then
	  MouseDown($MOUSE_CLICK_RIGHT)
   ElseIf $CmdLine[1] == "MOUSEUP" Then
	  MouseUp($MOUSE_CLICK_RIGHT)
   ElseIf $CmdLine[1] == "RORATESTART" Then
	  Send("{RIGHT down}")
   ElseIf $CmdLine[1] == "RORATEEND" Then
	  Send("{RIGHT up}")
   ElseIf $CmdLine[1] == "STARTFORWARD" Then
	  Send("{W down}")
   ElseIf $CmdLine[1] == "STOPFORWARD" Then
	  Send("{W up}")
   ElseIf $CmdLine[1] == "NHCB" Then
	  Send("{CTRLDOWN}")
	  Send("{S down}")
	  Sleep(700)
	  Send("{S up}")
	  Send("{CTRLUP}")
   ElseIf $CmdLine[1] == "NHCF" Then
	  Send("{CTRLDOWN}")
	  Send("{W down}")
	  Sleep(700)
	  Send("{W up}")
	  Send("{CTRLUP}")
   ElseIf $CmdLine[1] == "JUMP3" Then
	  Send("{SPACE DOWN}")
	  Sleep(50)
	  Send("{SPACE UP}")
	  Sleep(600)
	  Send("{SPACE DOWN}")
	  Sleep(50)
	  Send("{SPACE UP}")
	  Sleep(600)
	  Send("{SPACE DOWN}")
	  Sleep(50)
	  Send("{SPACE UP}")
   EndIf
EndIf

;
;Sleep(100)
;If WinActive("CửuÂmChânKinh:SaoHôm(3)") Then
;   MsgBox(0, "WoW Leecher", "ACTIVE THANH CONG")
;EndIf

;Send("{CTRLDOWN}")
;Send("{S down}")
;Sleep(700)
;Send("{S up}")
;Send("{CTRLUP}")

;MsgBox(0, "WoW Leecher", "Sorry the handle could not be found.")
