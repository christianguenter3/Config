; ===============================================
; Add your custom Commands to this file.
; If you want to break your commands up over multiple files, simply include a reference to them here.
;	e.g. #Include MyWorkRelatedCommands.ahk	; MyWorkRelatedCommands.ahk should be in the Commands directory along with this MyCommands.ahk file.
; ===============================================

AddCommand("EditMyCommands", "Opens the MyCommands.ahk script for editing in the default editor, or notepad.")
EditMyCommands()
{
	filePath = %A_ScriptDir%\Commands\MyCommands.ahk
	Run, edit %filePath%,,UseErrorLevel
	if (%ErrorLevel% = ERROR)
		Run, "notepad" "%filePath%"
}

AddCommand("EditMyHotkeys", "Opens the MyHotkeys.ahk script for editing in the default editor, or notepad.")
EditMyHotkeys()
{
	filePath = %A_ScriptDir%\Commands\MyHotkeys.ahk
	Run, edit %filePath%,,UseErrorLevel
	if (%ErrorLevel% = ERROR)
		Run, "notepad" "%filePath%"
}

AddCommand("HalloWelt", "Displays Hallo Welt")
HalloWelt()
{
	msgbox, Hallo Welt
}

AddCommand("1", "Goto Screen 1")
1()
{
	send ^!#a 
}

AddCommand("2", "Goto Screen 2")
2()
{
	send ^#!2
}

AddCommand("3", "Goto Screen 3")
3()
{
	send ^#!3
}

AddCommand("4", "Goto Screen 4")
4()
{
	send ^#!4
}

AddCommand("5", "Goto Screen 5")
5()
{
	send ^#!5
}

AddCommand("6", "Goto Screen 6")
6()
{
	send ^#!6
}

AddCommand("7", "Goto Screen 7")
7()
{
	send ^#!7
}

AddCommand("8", "Goto Screen 8")
8()
{
	send ^#!8
}

AddCommand("9", "Goto Screen 9")
9()
{
	send ^#!9
}

AddCommand("10", "Goto Screen 10")
AddCommand("0", "Goto Screen 10")
10()
{
	send ^#!0
}

AddCommand("11", "Goto Screen 11")
11()
{
	send ^#!'
}

AddCommand("12", "Goto Screen 12")
12()
{
	send ^#!=
}

AddCommand("xml", "XML Format")
xml()
{
	Runwait, %ComSpec% /K Y:\60_RUBY\50_XML_FORMATTER\xml_formatter.rb 'X' && exit,,PID	
	Sleep, 200
	send ^v
}

AddCommand("guid", "Create new Guid")
guid()
{	
	Clipboard := create_guid()
}

AddCommand("ProTime", "Start Protime")
ProTime(){
	Run "C:\Users\christian.guenter\Desktop\ProTime Mitarbeiter.SAP"
}

create_guid()
{
	TypeLib := ComObjCreate("Scriptlet.TypeLib")
	NewGUID := TypeLib.Guid	
	return RegExReplace(NewGUID,"[\{\}-]")
}

AddCommand("sscr", "SSCR")
sscr()
{
	InputBox, key , ,Objekt Schluessel,,250,150
	if ErrorLevel 
	{ 
		return
	}
	
	InputBox, system , ,System,,250,150
	if ErrorLevel 
	{ 
		return 
	}

	InputBox, version, ,Version, 250,150
	if ErrorLevel
	{
		return
	}

	Runwait, %ComSpec% /K "C:\Program Files\phantomjs-1.9.8-windows\phantomjs.exe" --ignore-ssl-errors=yes --web-security=false Y:\150_phantom_js\sscr.js S0009192093 s-U-2015 %key% %system% %version% && exit,,PID	
	FileRead, sscr, Y:\150_phantom_js\test.txt	
	Clipboard = %sscr%	
	FileDelete, Y:\150_phantom_js\test.txt
}

AddCommand("Last", "Show last Windows")
Last(){
	send ^+!#l
    send {down}
    send {down}
}

AddCommand("Win", "Show all windows")
Win(){
	send ^+!#a
}

AddCommand("Win2", "Show all windows thumbnail")
Win2(){
	send ^+!#n
}

AddCommand("sametime", "Sametime")
sametime(){
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinActivate, Sametime-Kontakte
	WinWaitActive, Sametime-Kontakte
    send {tab}
    send {tab}
    send {tab}
    send {tab}
    send ^f
    send {tab}
    send ^f
}

AddCommand("skype", "Skype")
skype(){
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinActivate, Skype
	WinWaitActive, Skype
}

AddCommand("sametime2","Sametime Text bearbeiten")
AddCommand("text","Sametime Text bearbeiten")
sametime2()
{
    show_sametime_text()
}

text()
{
    show_sametime_text()
}

show_sametime_text(){
	send +{tab 3} 
	send ^a
	send ^c
	Sleep, 100

    ; StringReplace, clipboard, clipboard, `r`n, , All

    text := RegExReplace(clipboard, "\d{2}\.\d{2}\.\d{4}", "")  ; 
    text := RegExReplace(text, "\d{2}\:\d{2}\:\d{2}\:", "")  ; 

	filename := "C:\Temp\" + create_guid()
	FileAppend, %text%, %filename%
	Sleep, 200
    Run, "C:\Program Files\Sublime Text 3\sublime_text.exe" %filename%
	Sleep, 3000
	FileDelete, %filename%
}

AddCommand("sametime3","Sametime Besprechungen")
sametime3(){
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinActivate, Besprechungen
	WinWaitActive, Besprechungen
}

AddCommand("Sublime", "Sublime")
Sublime(){

	; if WinExist("Sublime")
	; {
	; 	SetTitleMatchMode, 2
	; 	DetectHiddenWindows, On
	; 	WinActivate, Sublime
	; 	WinWaitActive, Sublime
	; }
	; else
	; {
		Run, "C:\Program Files\Sublime Text 3\sublime_text.exe"
; }
}

AddCommand("isPhone", "isPhone")
isPhone(){
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinActivate, IBM Lotus Notes is-phone
	WinWaitActive, IBM Lotus Notes is-phone
}

AddCommand("openTouch", "openTouch")
openTouch(){
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinActivate, OpenTouch 
	WinWaitActive, OpenTouch
}

AddCommand("HOSS", "hoss")
HOSS(){
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinActivate, HOSS
	WinWaitActive, HOSS
}

AddCommand("chrome_testmode", "Chrome Testmode for Fiori")
chrome_testmode(){
	send {F12}
	Sleep, 600
	send ^{SC029}
	sleep, 400
	send ^+m
	MouseMove, 236, 106
}

AddCommand("screenshot1", "Make Screenshot - Bereich")
screenshot1(){
	send !+P
}

AddCommand("screenshot2", "Make Screenshot - Komplett")
screenshot2(){
	send !+K
}

AddCommand("screenshot3", "Make Screenshot - Fenster")
screenshot3(){
	send !+F
}

AddCommand("VIM", "VIM")
VIM(){
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	; WinActivate, GVIM
	; WinWaitActive, GVIM
	WinActivate, VIM
	WinWaitActive, VIM
}

AddCommand("POW", "PowerShell")
POW(){
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinActivate, PowerShell
	WinWaitActive, PowerShell
}

AddCommand("Locals", "Locals")
Locals(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_tab_locals.vbs
}

AddCommand("Var_1", "Variablen 1")
Var_1(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_tab_var_1.vbs
}

AddCommand("Var_2", "Variablen 2")
Var_2(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_tab_var_2.vbs
}

AddCommand("Globals", "Globals")
Globals(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_tab_global.vbs
}

AddCommand("Auto", "Auto")
Auto(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_tab_auto.vbs
}

AddCommand("Memory", "Memory")
Memory(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_tab_memory.vbs
}

AddCommand("Stack", "Stack")
Stack(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_tab_stack.vbs
}

AddCommand("Code", "Code")
Code(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_tab_code.vbs
}

AddCommand("Tab", "Select Tab in SAPGUI")
Tab(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_find_tab.vbs
}

AddCommand("Services", "Services")
Services(){
    Run, C:\Users\christian.guenter\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_tab_services.vbs
}

AddCommand("Conv", "Conv")
Conv(){
    Run, Y:\60_RUBY\110_nwrfc\generic_converter.rb,,Hide
}


AddCommand("OSS","OSS Hinweis anzeigen")
OSS() 
{
	if (RegExMatch(Clipboard,"\d{5,10}")){
		note := Clipboard
	} else {
		InputBox, note , "Note:"
	}


	url := "https://launchpad.support.sap.com/#/notes/" . note . "/D"
	Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk" %url%
}

AddCommand("Translate", "Translate")
Translate(){
	url := "translate.google.de"
	Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk" %url%
}
