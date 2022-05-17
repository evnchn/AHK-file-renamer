#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

DetectHiddenText, Off

#NoTrayIcon

HotKey, >!., HandleRename


HandleRename() {
WinActivate
WinGet, currentexe, ProcessName
IfWinActive ahk_exe explorer.exe
{
Send, {F2}
Send, ^a
Send, ^c

RegExMatch(Clipboard, "\d\d\d\d\d\d\d\d_\d\d\d\d", OutputMatch)

if (OutputMatch <> "")
{
SplitPath, Clipboard,,,extension

InputBox, OutputPoststrin, Input suffix, e.g.: F6 CHEM (f6 chem is also acceptable)

StringReplace, OutputPoststr, OutputPoststrin, "_", " ", 1

StringUpper, OutputPoststrf, OutputPoststr 

; MsgBox, %OutputMatch%_%OutputPoststrf%.%extension%

Send, {F2}
Send, ^a
Send, %OutputMatch%_%OutputPoststrf%.%extension%

}
} 


URLDownloadToFile https://raw.githubusercontent.com/evnchn/AHK-file-renamer/main/renamer.ahk, renamer.ahk

Reload


return





}




