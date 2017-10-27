#e::Run C:\Users\guenterc\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\File Explorer.lnk

#f::Run C:\Program Files (x86)\Firefox Developer Edition\firefox.exe
sleep 500
send ^l
Sleep, 100
send ^a
return

#g::
; Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe ,, max
; Sleep,  100
; WinMaximize, Neuer Tab - Google Chrome
MsgBox 'Win+d benutzen!!!'
return

;Mouse zu Cursor Position und doppelklick
capslock & ,::
Mousemove A_CaretX + 5, A_CaretY + 5
click 2
return

^-::
click 2
return

!-::
click 2
return

^NUMPAD0::
send +^7
return
		
^K::
_SE16N_Tabelle()
return

!space:: ^!+#s

!K::
_SE16N_Tabelle()
return

_SE16N_Tabelle()
{
	WinGetTitle, Title, A
	;MsgBox, The active window is "%Title%".
	if ( Title = "Allgemeine Tabellenanzeige" )
	{
		send +^!t
	}
	else
	{
		_SEND_HOTKEY_WITHOUT_AHK("^k")
	}
	return
}

^i::
_in_adresszeile_springen()
return

^l::
_in_adresszeile_springen()
return

!i::
_in_adresszeile_springen()
return

#i::
_in_adresszeile_springen()
return		

_in_adresszeile_springen()
{
	WinGetClass, class, A
	IfInString, class, NWBC
	{
		send ^!l
		send ^a
		send /
		;_SEND_HOTKEY_WITHOUT_AHK("/")
		Return
	}
	if WinActive("ahk_class #32770")
	{
		send ^Ã¶
		return
	}
	if WinActive("ahk_class SAP_FRONTEND_SESSION")
	{
		_jump_to_addressbar_sap()
		return 
	}
	if WinActive("ahk_class OperaWindowClass")
	{
		send {F8}
		return
	}
	if Winactive("ahk_class CabinetWClass")
	{
		send {F4}
		send ^a
		return
	}
	if WinActive("ahk_class Chrome_WidgetWin_1")
	{
		send !d
		return
	}
	if WinActive("ahk_class Emacs"){
		_SEND_HOTKEY_WITHOUT_AHK("^l")
		return
	}
	send {F6}
	return
}

_jump_to_addressbar_sap()
{
	send ^/
	send /
	return	
}

_move_mouse_to_and_go_back(direction, _x, _y, width, height)
{
	MouseGetPos, x, y
	Click %direction%, %_x%, %_y%, down
	MouseMove, %Width%, %Height%
	Click up
	;mouseclickdrag, %direction%, %_x%, %_y%, %width%, %height%, 0
	mousemove x, y
	return
}

; CapsLock::
; If (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey<400)
; ;KeyWait, capslock
; {
; 	send {enter}

; }

Return

; if getkeystate("Shift") = 1
; {
; 	send { AppsKey }
; }
; Else
; {			
; 	Click	
; 	global press_count
; 	if (press_count > 0 )
; 	{			
; 		HotkeyHook("Down")
; 	  	HotkeyHook("Up")
; 	  	press_count := 0			
; 	} 
; }						
; return

capslock & #::
{
	send {enter}
	return
}

; Use Capslock and keys for vimlike navigation

Capslock & d::
SetCapsLockState, alwaysoff
if WinActive("ahk_class SAP_FRONTEND_SESSION") 
{
    times := 3
}
else
{
    times := 5
}

if GetKeyState("LAlt") = 1
{
    times := 15
}

if GetKeyState("Shift") = 1
{
    if GetKeyState("LAlt") = 1 {
        send +!{right %times%}
    }
    else
    {
        send +{right %times%}
    }
}
else
{
    send {right %times%}
}
return

Capslock & r::
SetCapsLockState, alwaysoff
if WinActive("ahk_class SAP_FRONTEND_SESSION") 
{
    times := 3
}
else
{
    times := 5
}

if GetKeyState("LAlt") = 1
{
    times := 15
}

if GetKeyState("Shift") = 1
{
    if GetKeyState("LAlt") = 1 {
        send +!{left %times%}
    }
    else
    {
        send +{left %times%}
    }
}
Else
{
    send {left %times%}
}

return
		
Capslock & t::
SetCapsLockState, alwaysoff
if WinActive("ahk_class SAP_FRONTEND_SESSION") 
{
    times := 3
}
else
{
    times := 5
}

if GetKeyState("LAlt") = 1
{
    times := 15
}

if GetKeyState("Shift") = 1
{
    if GetKeyState("LAlt") = 1 {
        send +!{down %times%}
    }
    else
    {
        send +{down %times%}
    }
}
Else
{
    send {down %times%}
}
return

Capslock & s::
SetCapsLockState, alwaysoff
if WinActive("ahk_class SAP_FRONTEND_SESSION") 
{
    times := 3
}
else
{
    times := 5
}

if GetKeyState("LAlt") = 1
{
    times := 15
}

if GetKeyState("Shift") = 1
{
    if GetKeyState("LAlt") = 1 {
        send +!{up %times%}
    }
    else
    {
        send +{up %times%}
    }
}
Else
{
    send {up %times%}
}
return

capslock & f::
send {return}
return

_send(key)		
{
	SetCapsLockState, alwaysoff

	modifier := ""

	if GetKeyState("LWin")  = 1
	{
		modifier := modifier . "#"			
	}

	if GetKeyState("shift") = 1
	{
		modifier := modifier . "+"
	}

	if GetKeyState("ctrl") = 1
	{
		modifier := modifier . "^"
	}

	if GetKeyState("'") = 1
	{
		modifier := modifier . "^"
	}

	if GetKeyState("alt") = 1
	{
		modifier := modifier . "!"
	}

	send %modifier%{%key%}
}

CapsLock & h::
_send("left")
Return

~capslock & n::
_send("down")
Return

~capslock & e::
_send("up")
Return

~capslock & i::
_send("right")
return

~capslock & u::
_send("home")
return

~capslock & y::
_send("end")n 
return

~capslock & vkBAsc019::	
_send("del")
return

~capslock & j::
SetCapsLockState, alwaysoff
if GetKeyState("shift") = 1
{
	send +{BackSpace}
}
Else
{
	send {BackSpace}
}
return

~capslock & space::
SetCapsLockState, alwaysoff
if GetKeyState("shift") = 1
{
	send +{enter}
}
Else
{
	send {enter}
}
return

~capslock & k::
_send("pgdn")
return

~capslock & q::
SetCapsLockState, alwaysoff
if GetKeyState("alt") = 1 
{
	if GetKeyState("shift") = 1
	{
		send !+{Escape}
	}
	Else
	{
		send !{Escape}
	}
}
else
{
	send {Escape}
}
return

~capslock & m::
_send("pgup")
return

~CapsLock & vk31sc002::
_send("F1")
return

~capslock & 2::
_send("F2")
return

~capslock & 3::
_send("F3")
return

~capslock & 4::
_send("F4")
return

~capslock & 5::
_send("F5")
return

~capslock & 6::
_send("F6")
return

~capslock & 7::
_send("F7")
return

~capslock & 8::
_send("F8")
return

~capslock & 9::
_send("F9")
return

~capslock & 0::
_send("F10")
return

;~capslock & -::
;_send("F11")
;return

~capslock & =::
_send("F12")
Return

CapsLock & a::
send_ae()		
return

send_ae()
{
	If GetKeyState("shift") = 1
	{
		send !+^a
	}
	Else
	{
		send ^!a
	}
}

;Abap Workbench in Objektliste springen
RAlt & z::
click 200, 600
return

Capslock & .::
SetScrollLockState, AlwaysOff
if GetKeyState("Ctrl") = 1
{	
	GetKeyState, state, LButton 
	if state = D
	{  
		Sleep, 200
		send ^c
		click left, up
		send ^c
	}
	Else
	{
		send ^y
		MouseGetPos, x, y
		Click Left, x, y, down			
	}			
}
Else if GetKeyState("Shift") = 1
{
	click right
}
else
{
	click
}

capslock & vkBDsc035::
click
return

CapsLock & vkE2sc00C::
_send("F11")
return
		
^!D::
send ^+7
send /h
send {enter}
return
						
^!w::
if WinActive("ahk_class SAP_FRONTEND_SESSION")
{
	mousemove, 50 ,90
	mouseclick
}
else
{
	_SEND_HOTKEY_WITHOUT_AHK("^!w")
}
return

^!p::
{
	send ^+p
	sleep 100
	send ^n
	sleep 50
	send {enter}
	sleep 50
	send ^v
	sleep 50
	click 354,
	sleep 50
	click 645, 100
	sleep 50
	mousemove 200,400
}

_SEND_HOTKEY_WITHOUT_AHK(_hotkey)
{
	hotkey %_hotkey%, , Off
	sleep 50
	send %_hotkey%
	sleep 50
	hotkey %_hotkey%, , On
	return
}

OSD(text)
{
	#Persistent
	Progress, hide x1050 Y900 b1 w150 h27 zh0 FM10 cwEEEEEE ct111111,, %text%, AutoHotKeyProgressBar, Verdana BRK
	WinSet, TransColor, 000000 120, AutoHotKeyProgressBar
	Progress, show
	SetTimer, RemoveToolTip, 1000
	Return
}

RemoveToolTip:
SetTimer, RemoveToolTip, Off
Progress, Off
return

label_char_to_char:
s1 := SubStr(A_ThisHotkey, 1 , 1) 
s2 := SubStr(A_ThisHotkey, 5 , 5)
send {%s1%}
send {%s2%}
return

label_char_to_char2:
s1 := SubStr(A_ThisHotkey, 1 , 9) 
s2 := SubStr(A_ThisHotkey, 12, 12)
return

CapsLock & o::
if GetKeyState("Shift") = 1
{
	send +^!o
}
Else
{	
	send ^!o
}
return

CapsLock & l::
if GetKeyState("Shift") = 1
{
	send +^!u
}
Else
{	
	send ^!u
}
return

CapsLock & [::
send ?
return

; ] & a::
; send {SC029} 
; return
;
; ] & r::
; send ~
; return
;
; ] & s::
; send {#}
; return
;
; +]::
; sendraw }
; return
;
; +^!]::
; send {+}
; return
;
; ]::
; sendraw ]
; return

+\::
send |
return

\ & space::
send ^{space}
Return

\ & CapsLock::
send {enter}
Return

\::
abc := "gjko"
Loop, Parse, abc
{
	Hotkey, \ & %A_LoopField%, label_char_to_char2, on
}
;Hotkey, \ & space, label_char_to_char2, on
send \
return

\ & q::
send @
return

\ & w:: 
send ^{F2}
return

\ & m::
send ^+{PgDn}
return

\ & k::
send ^+{PgUp}
return

; \ & m::
; if GetKeyState("Shift") = 1
; {
; 	send ^+{Right}
; 	send ^+{Right}
; 	send ^+{Left}
; }
; Else
; { 
; 	send ^{Right}
; 	send ^{Right}
; 	send ^{Left}
; }
; return 

\ & b::
if GetKeyState("Shift") = 1
{
	send ^+{Left}
	send ^+{Left}
	send ^+{Right}
}
Else
{ 
	send ^{Left}
	send ^{Left}
	send ^{Right}
}
return 

\ & f::
if GetKeyState("Shift", "P")
{
	send ^+{F3}
}
else
{
	send ^{F3}
}
return

\ & p::
send +{F1}
return

\ & a::
send_ae()
return

\ & SC029::
_move_mouse_to_and_go_back(right, 12, 120, 20, 120)
return


\ & 1::
{
if GetKeyState("Shift")
{
	_move_mouse_to_and_go_back(right, 351,32,355,100)							
}
Else
{
	MouseGetPos, x, y
	click, 62, 184
	mousemove x, y 
}				
return
}

\ & 2::
{
if GetKeyState("Shift"){
	MsgBox, Test
}
else
{
	_move_mouse_to_and_go_back(Right, 1250,350,1251,120)		
	send ^{tab}
	sleep 10
	send +{tab}
}
Return
}

\ & 3::
{
_move_mouse_to_and_go_back(Right, 1031,360,1032,360)		
Return
}

\ & 4::
{			
	MouseGetPos, _x, _y
	mousemove 1400,1030			
	MouseClick, right
	Sleep, 300
	send {Down}
	send {Down}
	send {enter}
	MouseMove, %_x%, %_y%
	Return		
}

\ & 5::
{
_move_mouse_to_and_go_back(Right, 1190,756,1190,760)		
Return
}	

\ & 6::
MouseGetPos, x, y
mousemove 850, 1018
Click 1
MouseClick, Right
Sleep, 100
Send {down 3}
Send {enter} 
Mousemove, x, y
return

\ & r::
if GetKeyState("Shift") = 1
{
	send ^+{left}
}
Else
{ 
	send ^{left}
}
return

\ & t::
if GetKeyState("Shift") = 1
{
	send ^+{up}
}
else
{
	send ^{up}
}
return

\ & s::
if GetKeyState("Shift") = 1
{
	send ^+{down}
}
Else
{
	send ^{down}
}
return
 
\ & d::
if GetKeyState("Shift") = 1
{
	send ^+{right}
}
Else
{	
	if GetKeyState("LWin") = 1
	{
		MouseGetPos, x, y
		x := x + 75
		MouseMove, x, y
		return
	}	
	else 	
	{
		send ^{right} 
	}
}
return

\ & tab::
if GetKeyState("Shift") = 1
{
	send ^+{tab}
}
else
{
	send ^{tab}
}
return

\ & h::
send ^!{left}
_nwbc_escape()
return

\ & n::
send ^!{down}
_nwbc_escape()
return

\ & e::
send ^!{up}
_nwbc_escape()
return

\ & i::
send ^!{right}
_nwbc_escape()
return

\ & z::
send ^#z
return

\ & v::
send ^#y
Return

\ & x::
send {=}{>}
return

\ & c::
send {-}{>}
return

\ & l::
MouseClick, Wheeldown
return

\ & u::
MouseClick, Wheelup
return

\ & y::
send ^y
return

\ & vkBAsc019::
send ^+{F10}
Return

\ & [::
send ^+{F11}
return

' &  vkBAsc019::
_send_save_literal_key()
return

^vkBAsc019::
_send_save_literal_key()
return

_send_save_literal_key(){
	send !^+%saveLiteralKey%
	_nwbc_escape()
} 

_nwbc_escape(){
	WinGetClass, class, A
	IfInString, class, NWBC
	{
		send {Escape}
	}	
}
 
label_char_to_char3:
s1 := SubStr(A_ThisHotkey, 4, 4)
if GetKeyState("Shift") = 1
{
	send ^+{%s1%}
}
Else
{
	send ^{%s1%}
}
return

$+'::
_SEND_HOTKEY_WITHOUT_AHK("+'")
return

' & space::
; if GetKeyState("Shift") = 1
; {
; 	send ^#{space}
; }
; Else
; {
; 	send ^{space}
; }
return 

' & SC029::
send ^{SC029}
return

' & tab::
Hotkey, %A_ThisHotkey%, , off
if GetKeyState("Shift") = 1 {
    send +{tab}
    send +{tab}
    send +{tab}
} else {

    send {tab}
    send {tab}
    send {tab}
}
Hotkey, %A_ThisHotkey%, , on
Return

' & backspace::
Hotkey, %A_ThisHotkey%, , off
send ^{backspace}
Hotkey, %A_ThisHotkey%, , on
return

' & vkBFsc056::
_in_adresszeile_springen()
return
 

'::
global aposRun
if !aposRun 
{
    aposRun := true
    abc := "abcdefghijklmnopqrstuvwxyz1234567890,."
    Loop, Parse, abc
    {
        Hotkey, ' & %A_LoopField%, label_char_to_char3, on
    }
    Hotkey, ' & /, makro_in_adresszeile_springen, on
}
send '
return

makro_in_adresszeile_springen:
_in_adresszeile_springen( )
return

+,::
_SEND_HOTKEY_WITHOUT_AHK("+,")
return

^,::
_SEND_HOTKEY_WITHOUT_AHK("^,")
return

^+,::
_SEND_HOTKEY_WITHOUT_AHK("^+,")
return

,::
_SEND_HOTKEY_WITHOUT_AHK(",")
return

s1(){
	send ^!#a
}

s2(){
	send ^!#2
}

s3(){
	send ^!#3
}

s4(){
	send ^!#4
}

s5(){
	send ^!#5
}

s6(){
	send ^!#6
}

s7(){
	send ^!#7
}

s8(){
	send ^!#8
}

s9(){
	send ^!#9
}

s10(){
	send ^!#0
}

s11(){
	send ^!#'
}

s12(){
	send ^!#=
}

a1(){
	send !+1
}

a2(){
	send !+2
}

a3(){
	send !+3
}

a4(){
	send !+4
}

a5(){
	send !+5
}

a6(){
	send !+6
}

a7(){
	send !+7
}

a8(){
	send !+8
}

a9(){
	send !+9
}

a10(){
	send !+0
}

a11(){
	send !+-
}

a12(){
	send !+=
}

; Navigate in the ABAP Debugger

CursorUpperLeftCorner(){
	if GetKeyState("shift") = 1
	 {
	 	WinGetActiveTitle, title
		ControlClick, ToolbarWindow321, %title%
	 } 
	 else 
	 {
	 	_move_mouse_to_and_go_back(Right, 360, 360, 360,360)			
	 }
	 return	
}

CursorLowerLeftCorner(){
 _move_mouse_to_and_go_back(Right, 360,756,360,760)		
}

CursorLowerRightCorner(){
 _move_mouse_to_and_go_back(Right, 1190,756,1190,760)		
}

CursorUpperRightCorner(){
 _move_mouse_to_and_go_back(Right, 1031,360,1032,360)		
}

; Display Fusion
AppUpperLeftCorner(){
	send ^#z
}

AppLowerLeftCorner(){
	send ^#x
}

AppLowerRightCorner(){
	send ^#c
}

AppUpperRightCorner(){
	send ^#v
}

SAPGuiGOS(){
	Run, C:\Users\guenterc\Dropbox\Arbeit\10_SAP_Gui_Scripts\SAPGuiGOS.vbs
}

label_send_strg_point:
if GetKeyState("shift") = 1
{
	send +^.
}
else
{
	send ^.	
}
Return

label_send_strg_comma:
	if GetKeyState("shift") = 1
	{
		send +^,
	}
	else
	{
		send ^,
	}
Return

label_sap_to_literal:	
key := SubStr(A_ThisHotkey, 13 , 1)
_jump_to_literal_sap(key)
return		

global saveLiteralKey := ""

_jump_to_literal_sap(key)
{			
	global saveLiteralKey := key
	send !^+%key%
	WinGetClass, class, A
	IfInString, class, NWBC
	{
		send {Escape}
	}
	return
}
return 

; Function Module Definition

^!f::
Gui, add, Button, gLaunchComponentsStructure, Components (Structure)
Gui, add, Button, gLaunchComponentsStructureKeys, Components (Structure) Keys only
Gui, add, Button, gLaunchComponentsStructureKeysData, Components (Structure) Keys only with Data Declaration
Gui, add, button, gLaunchInterface, Data Declaration (Interface)
Gui, add, button, gLaunchInterfaceWithCall, Data Declaration (Interface) with Call
Gui, add, button, gLaunchPrettyPrint, Pretty Print
CoordMode, Caret, Screen
gui, show, x%A_CaretX% y%A_CaretY%
return

LaunchComponentsStructure:
WinClose, ahk_class AutoHotkeyGUI
Runwait, %ComSpec% /K Y:\60_Ruby\20_test_sapnwrfc\DDIC_Info.rb "%Clipboard%" && exit,,PID
Sleep, 100
send ^v
return

LaunchComponentsStructureKeys:
WinClose, ahk_class AutoHotkeyGUI 
Runwait, %ComSpec% /K Y:\60_Ruby\20_test_sapnwrfc\DDIC_Info.rb "%Clipboard%" "X" && exit,,PID
Sleep, 100
send ^v
return

LaunchComponentsStructureKeysData:
WinClose, ahk_class AutoHotkeyGUI
Runwait, %ComSpec% /K Y:\60_Ruby\20_test_sapnwrfc\DDIC_Info.rb "%Clipboard%" "X" "X" && exit,,PID
Sleep, 100
send ^v
return

LaunchInterface:
WinClose, ahk_class AutoHotkeyGUI
object := evaluate_object()
if !object 
{
	return
}	
Runwait, %ComSpec% /K Y:\60_Ruby\20_test_sapnwrfc\FM_interface.rb "%object%" && exit,,PID
Sleep, 100
send ^v
return

LaunchInterfaceWithCall:
WinClose, ahk_class AutoHotkeyGUI
Runwait, %ComSpec% /K Y:\60_Ruby\20_test_sapnwrfc\FM_interface.rb "%Clipboard%" WITH_CALL && exit ,,PID
Sleep, 100
send ^v
return

LaunchPrettyPrint:
WinClose, ahk_class AutoHotkeyGUI
Runwait, %ComSpec% /K Y:\60_Ruby\20_test_sapnwrfc\Pretty_Print.rb start && exit,,PID
Sleep, 100
send ^v
return

 evaluate_object()
 {
	local_object = %Clipboard%
	if RegExMatch(local_object, "->")
	{
		CoordMode, Caret, Screen
		InputBox, classname , "Input Classname", , , , 100, %A_CaretX%, %A_CaretY%, 
		if ErrorLevel
		{
			Return ""
		}
		Else
		{
			local_object := RegExreplace(local_object, ".*(->.*)", classname . "$1")
		}
	}
	return local_object		
}

; press_count = 0
;
; MyAppsKeyHotkeys(enable)
; {
;    if (enable = "Off")
;    {
;       Menu, TRAY, Icon, %A_ScriptDir%\Letter-E.ico
;    }
;    else
;    {
;       Menu, TRAY, Icon, %A_ScriptDir%\Letter-C.ico
;    }
;     HotKey,  a, MyMouseLeftComplete,	%enable%
;     HotKey,  b, MyMouseRightSlow,		%enable%
;     HotKey,  c, MyMouseUpSlow,	 		%enable%
;     HotKey,  d, MyMouseRightFast,		%enable%
;     HotKey,  e, MyMouseUp, 				%enable%
;     HotKey,  f, MyEmpty, 				%enable%
;     HotKey,  g, MyEmpty, 				%enable%
;     HotKey, *h, MyMouseLeft,  			%enable%
;     HotKey, *i, MyMouseRight,   		%enable%
;     HotKey, *j, MyEmpty,  				%enable%
;     HotKey, *k, MyEmpty,  				%enable%
;     HotKey, *l, MyEmpty,  				%enable%
;     Hotkey, *m, MyEmpty,  				%enable%
;     HotKey, *n, MyMouseDown,  			%enable%
;     HotKey, *o, MyMouseRightComplete, 	%enable%
;     HotKey, *p, MyEmpty,    			%enable%
;     HotKey,  q, MyEmpty, 				%enable%
;     HotKey,  r, MyMouseLeftFast, 		%enable%
;     HotKey,  s, MyMouseUpFast, 			%enable%
;     HotKey,  t, MyMouseDownFast, 		%enable%
;     HotKey, *u, MyHome,  				%enable%
;     HotKey,  v, MyMouseDownSlow,		%enable%
;     HotKey,  w, MyTop,	 				%enable%
;     HotKey,  x, MyMouseLeftSlow,		%enable%
;     Hotkey, *y, MyEmpty,				%enable%
;     HotKey,  z, MyEmpty,				%enable%
;     HotKey, *;, MyEnter, 				%enable%
;     HotKey, *[, MyEmpty, 				%enable%
;     HotKey,  ], MyEmpty, 				%enable%
;     HotKey,  ., MyEmpty, 				%enable%
;    	;HotKey,  /, MyEmpty, 				%enable%
; }
;
; MyTop:
; 	press_count += 1
; 	MouseMove, 150, 150
; 	MouseClick, Right
; 	HotkeyHook("Down")
; 	HotkeyHook("Up")
; 	return
; MyMouseLeftComplete:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	x := -2000
; 	MouseMove, x, y
; 	return
; MyMouseRightComplete:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	x := x + 2000
; 	MouseMove, x, y
; 	Return
; MyMouseLeft:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	x := x - 100
; 	MouseMove, x, y
; 	return
; MyMouseRight:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	x := x + 100
; 	MouseMove, x, y
; 	Return
; MyMouseDown:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	y := y + 100
; 	MouseMove, x, y
; 	Return
; MyMouseUp:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	y := y - 100
; 	MouseMove, x, y
; 	Return
; MyMouseLeftSlow:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	x := x - 22
; 	MouseMove, x, y
; 	return
; MyMouseRightSlow:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	x := x + 22
; 	MouseMove, x, y
; 	Return
; MyMouseDownSlow:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	y := y + 22
; 	MouseMove, x, y
; 	Return
; MyMouseUpSlow:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	y := y - 22
; 	MouseMove, x, y
; 	Return
; MyMouseLeftFast:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	x := x - 300
; 	MouseMove, x, y
; 	Return
; MyMouseRightFast:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	x := x + 300
; 	MouseMove, x, y
; 	Return
; MyMouseDownFast:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	y := y + 300
; 	MouseMove, x, y
; 	Return
; MyMouseUpFast:
; 	press_count += 1
; 	MouseGetPos, x, y
; 	y := y - 300
; 	MouseMove, x, y
; 	Return
; MyEmpty:
;    Return
; MyUp:
;    press_count += 1
;    Send {Blind}{Up} ;fix for OneNote use SendPlay
;    Return
; MyDown:
;    press_count += 1
;    Send {Blind}{Down} ;fix for OneNote use SendPlay
;    Return
; MyLeft:
;    press_count += 1
;    Send {Blind}{Left}
;    Return
; MyRight:
;    press_count += 1
;    Send {Blind}{Right}
;    Return
; MyPgUp:
;    press_count += 1
;    Send {Blind}{PgUp}
;    Return
; MyPgDn:
;    press_count += 1
;    Send {Blind}{PgDn}
;    Return
; MyEnter:
;    press_count += 1
;    Send {Blind}{Enter}
;    Return
; MyBS:
;    press_count += 1
;    Send {Blind}{BS}
;    Return
; MyDel:
;    press_count += 1
;    Send {Blind}{Del}
;    Return
; MyHome:
;    press_count += 1
;    Send {Blind}{Home}
;    Return
; MyEnd:	
;    press_count += 1
;    Send {Blind}{End}
;    Return
; MyApps:
;    press_count += 1
;    Send {Blind}{AppsKey}
;    Return
; MyEsc:
;    press_count += 1
;    Send {Esc}
;    Return

SetCapsLockState, AlwaysOff
;
;#IfWinNotActive ahk_class TscShellContainerClass
 ;CapsLock & '::
 ;if GetKeyState("shift") = 1
 ;{
 	;HotkeyHook("Down")
 ;}
 ;return
;
 ;CapsLock & ' Up::
 ;if GetKeyState("shift") = 1
 ;{
 	;HotkeyHook("Up")
 ;}
 ;return
;#IfWinNotActive
;
;HotkeyHook(Mode)
;{
   ;static sticky_hotkeys = 0
   ;global press_count
   ;if (Mode = "Down")
   ;{
      ;if (sticky_hotkeys = 1)
      ;{
         ;sticky_hotkeys = 2
      ;}
      ;else
      ;{
         ;MyAppsKeyHotkeys("On")
         ;press_count = 0
      ;}
   ;}
   ;else if (Mode = "Up")
   ;{
      ;if (sticky_hotkeys = 0)
      ;{
         ;if (press_count = 0)
         ;{
            ;sticky_hotkeys = 1
         ;}
         ;else
         ;{
            ;MyAppsKeyHotkeys("Off")
         ;}
      ;}
      ;else if (sticky_hotkeys = 2)
      ;{
         ;MyAppsKeyHotkeys("Off")
         ;sticky_hotkeys = 0
      ;}
   ;}
;}
    
CapsLock & w::
send {BackSpace}
return

CapsLock & p::
send +{enter}
return

CapsLock & g::
send {=}{>}
return

~capslock & x::
send {+}
return

~capslock & c::
send {*}
return

CapsLock & z::
SysGet, MonitorCount, MonitorCount
SysGet, MonitorPrimary, MonitorPrimary
MsgBox, Monitor Count:`t%MonitorCount%`nPrimary Monitor:`t%MonitorPrimary%
Loop, %MonitorCount%
{
    SysGet, MonitorName, MonitorName, %A_Index%
    SysGet, Monitor, Monitor, %A_Index%
    SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%
    MsgBox, Monitor:`t#%A_Index%`nName:`t%MonitorName%`nLeft:`t%MonitorLeft% (%MonitorWorkAreaLeft% work)`nTop:`t%MonitorTop% (%MonitorWorkAreaTop% work)`nRight:`t%MonitorRight% (%MonitorWorkAreaRight% work)`nBottom:`t%MonitorBottom% (%MonitorWorkAreaBottom% work)
}
Return

CapsLock & v::
send {+}
return

CapsLock & b::
send {*}
return

::ibox::
SendInput, 01800180
return


::fnd::
send n
send % chr( 47 ) 
Sleep, 100
send iwfnd
send % chr( 47 ) 
return

::por::
send Portalrollen zugeordnet
return

::kei::
send Keine Aktion notwendig
return

::gru::
send Gruß Christian
return 

;=============================
; EMACS

#Include Y:\Dokumente\Autohotkey\emacs-key-sequence.ahk

$^t::
map:=Object()
map.insert("^ta",  "apostrophe")
map.insert("^tq",  "apostrophe")
map.insert("^td",  "removeFirstAndLast")
map.insert("^t2d", "2removeFirstAndLast")
map.insert("^t3d", "3removeFirstAndLast")
map.insert("^tu",  "brackets")
map.insert("^ty",  "brackets")
map.insert("^tk",  "squareBrackets")
map.insert("^tm",  "squareBrackets")
map.insert("^tv",  "curlyBrackets")
map.insert("^tb",  "curlyBrackets")
map.insert("^t'",  "quote")
map.insert("^tw",  "doubleQuote")
map.insert("^t/",  "pipe")
map.insert("^t\",  "pipe")
map.insert("^t,",  "angleBracket")
map.insert("^t.",  "angleBracket")
map.insert("^tg",  "percentage")
map.insert("^tr",  "space")
map.insert("^t-",  "asterisk")
map.insert("^tha", "replApostrophe")
map.insert("^thq", "replApostrophe")
map.insert("^thy", "replBrackets")
map.insert("^thu", "replBrackets")
map.insert("^thr", "replSpace")
map.insert("^th-", "replAsterisk")
map.insert("^thk", "replSquareBrackets")
map.insert("^thm", "replSquareBrackets")
map.insert("^thv", "replCurlyBrackets")
map.insert("^thb", "replCurlyBrackets")
map.insert("^th'", "replQuote")
map.insert("^thw", "replDoubleQuote")
map.insert("^th/", "replPipe")
map.insert("^th\", "replPipe")
map.insert("^th,", "replAngleBracket")
map.insert("^th.", "replAngleBracket")
map.insert("^thg", "replPercentage")
map.insert("^thst","replStringTemplate")
map.insert("^tst", "stringTemplate")
map.insert("^te",  "SerchWindowAndActivate")
map.insert("^tt",  "sapGuiTabs")
map.insert("^tf",  "sapGuiTab")
map.insert("^tp",  "sapGuiToolBar")
map.insert("^tg",  "SAPGuiToolUsrTips")
map.insert("^tj",  "SAPGuiToolAllTips")
map.insert("^tc",  "ALVToolbar")
map.insert("^tx",  "getAllControlsStart")
map.insert("^tz",  "getFocus")
map.insert("^tn",  "addresszeile")
map.insert("^to",  "addresszeile_scwm_o")
map.insert("^t[",  "gotoError")
map.insert("^t]",  "correctError")
map.insert("^t1",  "activateWindowOnScreenOne")
map.insert("^t2",  "activateWindowOnScreenTwo")
map.insert("^t3",  "activateWindowOnScreenThree")
map.insert("^tl",  "lastWindow")
prefixKey("^t",map)
return

SerchWindowAndActivate(){
	InputBox, win_title, "Fenster Titel" 
	if !ErrorLevel {
		win_title := "i)" . win_title
		SetTitleMatchMode, RegEx
		DetectHiddenWindows, On
		WinActivate, %win_title%
		WinWaitActive, %win_title%
	}
}

shiftInsert(){
    send +{insert}
}

apostrophe(){
    smartEnclosing("``" ,"``")
}

replApostrophe(){
    smartReplacing("``" ,"``")
}

brackets(){
	smartEnclosing("(",")")
}

replBrackets(){
    smartReplacing("(",")")
}

curlyBrackets(){
	smartEnclosing("{","}")
}

replCurlyBrackets(){
    smartReplacing("{","}")
}

squareBrackets(){
	smartEnclosing("[","]")
}

replSquareBrackets(){
    smartReplacing("[", "]")
}

quote(){
	smartEnclosing("'","'")
}

replQuote(){
    smartReplacing("'","'")
}

doubleQuote(){
	smartEnclosing("""","""")
}

replDoubleQuote(){
    smartReplacing("""","""")
}

pipe(){
	smartEnclosing("|","|")
}

replPipe(){
    smartReplacing("|","|")
}

percentage(){
	smartEnclosing("%","%")
}

replPercentage(){
    smartReplacing("%","%")
}

space(){
    smartEnclosing(" ", " ")
}

asterisk(){
    smartEnclosing("*","*")
}

replAsterisk(){
    smartReplacing("*","*")
}

replSpace(){
    smartReplacing(" ", " ")
}

angleBracket(){
	smartEnclosing("<",">")
}

replAngleBracket(){
    smartReplacing("<",">")
}

stringTemplate(){
	smartEnclosing("|{ "," }|")	
}

replStringTemplate(){
    smartReplacing("|{ "," }|")
}

smartEnclosing(openingCharacter,closingCharacter){
	send ^c
	ClipWait
	clipboard := openingCharacter Clipboard closingCharacter
	send ^v
    markClipboardLength()
}

smartReplacing(openingCharacter,closingCharacter){
    send ^c
    ClipWait
    clipboard := openingCharacter SubStr(clipboard,2,strlen(clipboard)-2) closingCharacter
    send ^v
    markClipboardLength()
}

NremoveFirstAndLast(n){
	send ^c
	ClipWait
    start := n+1
    end := 2*n
	val := SubStr(Clipboard,start,strlen(Clipboard)-end)
	clipboard = %val%
	send ^v
    markClipboardLength()
}

markClipboardLength(){
    len := strlen( clipboard )
    if Winactive("ahk_class SAP_FRONTEND_SESSION")
    {
        len := len / 2 + 1
        send +{left %len%}
    } else {
        sendinput +{left %len%}
    }
}

removeFirstAndLast(){
    NremoveFirstAndLast(1)
 }

2removeFirstAndLast(){
    NremoveFirstAndLast(2)
}

3removeFirstAndLast(){
    NremoveFirstAndLast(3)
}

 getFocus(){
    focus := getSapGui().ActiveSession().ActiveWindow().GuiFocus()

    name := focus.name
    id   := focus.id
    type := focus.type

    return id
 }

getErrorShell(){
    Session := getSapGui().ActiveSession

    try {
        grid := Session.findById("wnd[0]/shellcont/shell/shellcont[1]/shell")
    } catch e {
        try {
            grid := Session.findById("wnd[0]/shellcont[0]/shell/shellcont[1]/shell")
        } catch e {
            try {
                grid := Session.findById("wnd[0]/shellcont[1]/shell/shellcont[1]/shell")
            } catch e {
                try {
                    grid := Session.findById("wnd[0]/shellcont[2]/shell/shellcont[1]/shell")
                } catch e {
                    return    
                }
            }
        }
    }

    return grid
}

clickMessage(){

    Session := getSapGui().ActiveSession

    try {
    	statusBar := Session.findById("wnd[0]/sbar")
    	statusBar.doubleClick()
    	WinWaitActive, Performance Assistant
    	shell := Session.findById("wnd[0]/shellcont[1]/shell/shellcont[1]/shell")
    	shell.setFocus()
		; Sleep, 200
		send ^a
		send ^c
		send !{f4}
		filename := "C:\Temp\" + create_guid()
		FileAppend, %clipboard%, %filename%
		Sleep, 100
	    Run, "C:\Program Files\Sublime Text 3\sublime_text.exe" %filename%
		Sleep, 1000
		FileDelete, %filename%
    } catch e {
    	MsgBox, %e%
    }
}

gotoError(){
    grid := getErrorShell()
    if grid
    {
        ButtonId := grid.GetToolbarButtonId(1)
        grid.pressToolbarButton(ButtonId)
    }
}

correctError(){
    grid := getErrorShell()
    if grid
    {
        grid.setCurrentCell(0,"CORRECT")
        grid.clickCurrentCell
    }
}

getAllControlsStart(){
    ; "wnd[0]/usr/shell/sheelcont[1]/shell/shellcont[0]/shell"
    all_controls := getAllControls("wnd[0]/tbar[1]")

    maxIndex := all_controls._MaxIndex()
    index := 0

    Loop %maxIndex%
    {
        index := index + 1
        item := all_controls[index]

        id := item.id
        type := item.type
        text := item.text
        tooltip := item.tooltip

        text = %id% + " " + %type% + " " + %text% + " " & %tooltip% 
        MsgBox %text% 
    }
}

getAllControls(start){
    Session := getSapGui().ActiveSession
    
    element := Session.findById(start)
    
    item := Object()
    array := Object()
    
    item.id := element.id
    item.type := element.type
    item.text := element.text
    item.tooltip := element.tooltip

    array.insert(item)

    index := 0
    children := element.Children()
    count := children.Count() 
    if count = 0
    {
        return array
    }
    Loop %count%

    {
        child := children.Item(index)

        try
        {
            if child.Children.count() > 0
            {
                new_array := getAllControls(child.id)

                index2 := 0

                new_index := new_array._MaxIndex()

                Loop %new_index%
                {
                    index2 := index2 + 1

                    array.insert(new_array[index2])
                }
            }
            else
            {
                item := Object()

                try
                {
                    item.id := child.id
                    item.type := child.type
                    item.text := child.text
                    item.tooltip := child.tooltip
                } catch e {

                }

                array.insert(item)    
            }
        } catch e {
            item := Object()
            item.id := child.id
            item.type := child.type
            item.text := child.text
            item.tooltip := child.tooltip
            array.insert(item)
        }
        index := index + 1
    }
    return array
}

ALVToolbar(){
    Session := getSapGui().ActiveSession

    index := 0

    try 
    {
        shell := Session.findById(getFocus())
    } catch e {
        return
    }

    gui, 4:Add, ListView, r25 w700 gMyListView, Name|ButtonId|Id
    gui, 4:Default

    Loop, 30
    {
        try 
        {
            id := shell.id
            text := shell.GetToolbarButtonTooltip(index)
            ButtonId := shell.GetToolbarButtonId(index)
            if not text = ""

            {
                LV_Add("4", text, ButtonId, id)
            }

        } catch e {
        }

        index := index + 1
    }
    LV_ModifyCol()
    Gui, 4:Add, Button, Hidden Default, OK_GRID
    Gui, 4:Show

}

sapGuiTab(){
    Run, C:\Users\guenterc\Dropbox\Arbeit\10_SAP_Gui_Scripts\debug_find_tab.vbs
}

sapGuiToolBar(){
    Gui, 3:Add, ListView, r25 w700 gMyListView, Name|Id
    Gui, 3:Default 

    all_controls := getAllControls("wnd[0]/tbar[1]")

    add_controls_to_gui(all_controls,"3")

    Gui, 3:Add, Button, Hidden Default, OK
    Gui, 3:Show
    return
}

getSapGui(){
    global _sap
    if not isObject(_sap)
    {
        _sap := ComObjGet("SAPGUI").GetScriptingEngine()
    }

    return _sap
}

addTooltips(Element){
    index := 0
    Children := Element.Children()
    count := Children.Count() 
    if count = 0
    {
        return
    }

    Loop %count%
    {
        child := Children.Item(index)

        id := child.id

        text := child.ToolTip

        if not text = ""
        {
            LV_Add("3", text, child.id)
        } 
        else 
        {
            text := child.Text
            if not text = ""
            {
                LV_Add("3", text, child.id)
            } 
        }

        try
        {
            if child.Children.count() > 0
            {
                item := getSapGui().findById(child.id)
                addTooltips(item)
            }
        } catch e {

        }
        index := index + 1
    }
}

addTabs(Element){
    index := 0
    Children := Element.Children()
    count := Children.Count() 
    if count = 0
    {
        return
    }

    Loop %count%
    {
        child := Children.Item(index)
        id := child.id
        try
        {
            if child.Children.count() > 0
            {
                item := getSapGui().findById(child.id)
                addTabs(item)
            }
        } catch e {

        }

        if child.type = "GuiTab"
        {
            text := child.text
            if not text = ""
            {
                LV_Add("3", text, child.id)
            }
        }
        index := index + 1
    }
}

SAPGuiToolUsrTips(){

    all_controls := getAllControls("wnd[0]/usr")

    Gui, 3:Add, ListView, r25 w700 gMyListView, Name|Id
    Gui, 3:Default 


    add_controls_to_gui(all_controls,"3")
    

    Gui, Add, Button, Hidden Default, OK_F2
    Gui, Show
    return
}


SAPGuiToolAllTips(){
    ; all_controls := getAllControls("wnd[0]/usr")
    all_controls := getAllControls("wnd[0]")

    Gui, 3:Add, ListView, r25 w700 gMyListView, Name|Id
    Gui, 3:Default 


    add_controls_to_gui(all_controls,"3")
    

    Gui, Add, Button, Hidden Default, OK_F2
    Gui, Show
    return
}

add_controls_to_gui(controls,gui){
    index := 0
    max_index := controls._MaxIndex() + 1

    Loop %max_index%
    {
        item := controls[index]
        id := item.id
        type := item.type
        text := item.text
        tooltip := item.tooltip
    
        if not ToolTip = ""
        {
            text := ToolTip
        }

        if not text = "" 
        {
            LV_Add(gui, text, id)
        }
        index := index + 1

    }
    
    LV_ModifyCol()
}

SAPGuiTabs(){

	Session := getSapGui().ActiveSession 
    User := Session.findById("wnd[0]/usr")

    Gui, 3:Add, ListView, r25 w700 gMyListView, Name|Id
    Gui, 3:Default 

    addTabs(User)
    
    LV_ModifyCol()

    Gui, Add, Button, Hidden Default, OK_SELECT
    Gui, Show
    return
}
3ButtonOk:
    index := LV_GetNext(0, "Focused")
    LV_GetText(RowId, index, 2) 
    item := getSapGui().findById(RowId)
    item.setFocus
    Gui, 3:destroy
    WinClose
    send {enter}
return

3ButtonOK_SELECT:
    index := LV_GetNext(0, "Focused")
    LV_GetText(RowId, index, 2) 
    item := getSapGui().findById(RowId)
    item.select
    Gui, 3:destroy
    WinClose
return

3ButtonOk_F2:
    index := LV_GetNext(0, "Focused")
    LV_GetText(RowId, index, 2) 
    LV_GetText(name, index, 1) 
    item := getSapGui().findById(RowId)
    item.setFocus
    Gui destroy
    WinClose

    type := item.type

    if item.type = "GuiButton"
    {
        send {enter}
    } else {
        ; send {F2}
    }
return

4ButtonOK_GRID:
    index := LV_GetNext(0, "Focused")
    LV_GetText(Id, index, 3) 
    LV_GetText(ButtonId, index, 2) 
    item := getSapGui().findById(Id)
    item_id := item.name
    try {
        item.pressToolbarContextButton(ButtonId)
        item.pressToolbarButton(ButtonId)
    } catch e {

    }
    Gui destroy
    WinClose
return

MyListView:
    Gui destroy
    WinClose
return

3GuiEscape:
    Gui destroy
    WinClose
return

4GuiEscape:
    Gui destroy
    WinClose
return

lastWindow()
{
	send ^+!#l
	sleep, 5E0
    send {down}
    send {down}
}

convert(){
    Runwait, Y:\60_RUBY\110_nwrfc\generic_converter.rb,,Hide
    #Persistent
    ToolTip, OK
    SetTimer, RemoveToolTip2, 500
    return
}

generate_lid(){
    Runwait, Y:\60_RUBY\110_nwrfc\lid_generator.rb,,Hide
    #Persistent
    ToolTip, OK
    SetTimer, RemoveToolTip2, 500
    return
}

RemoveToolTip2:
SetTimer, RemoveToolTip2, Off
ToolTip
return

$^n::
map:=Object()
map.insert("^na","s1")
map.insert("^n1","s1")
map.insert("^nr","s2")
map.insert("^n2","s2")
map.insert("^ns","s3")
map.insert("^n3","s3")
map.insert("^nt","s4")
map.insert("^n4","s4")
map.insert("^nd","s5")
map.insert("^n5","s5")
map.insert("^nh","s6")
map.insert("^n6","s6")
map.insert("^nn","s7")
map.insert("^n7","s7")
map.insert("^ne","s8")
map.insert("^n8","s8")
map.insert("^ni","s9")
map.insert("^n9","s9")
map.insert("^no","s10")
map.insert("^n0","s10")
map.insert("^n-","s11")
map.insert("^n'","s11")
map.insert("^n=","s12")
map.insert("^n\","s12")
map.insert("^n/","addresszeile")
map.insert("^n.","SAPGuiToolTips")
map.insert("^n,","alvToolbarClick")
map.insert("^nq","CursorUpperLeftCorner")
map.insert("^nw","CursorLowerLeftCorner")
map.insert("^nf","CursorLowerRightCorner")
map.insert("^np","CursorUpperRightCorner")
map.insert("^nz","AppUpperLeftCorner")
map.insert("^nx","AppLowerLeftCorner")
map.insert("^nc","AppLowerRightCorner")
map.insert("^nv","AppUpperRightCorner")
map.insert("^ny","shiftInsert")
map.insert("^nk","convert")
map.insert("^nl","generate_lid")
map.insert("^nm","clickMessage")
prefixKey("^n",map)
return

addresszeile(){
    _in_adresszeile_springen( )
    sendinput n/scwm/
}

addresszeile_scwm_o(){
    _in_adresszeile_springen( )
    sendinput o/scwm/
}

Screenshot(){
    send ^p
}

#n::
map:=Object()
map.insert("#nq","SAPGuiGOS" )
map.insert("#nn","Copy")
map.insert("#ne","Paste")
map.insert("#ni","SwitchTab")
map.insert("#no","_Tab")
map.insert("#np","Screenshot")
map.insert("#na","testGlobalVar")
; map.insert("#n1","s1")
; map.insert("#nr","s2")
; map.insert("#n2","s2")
; map.insert("#ns","s3")
; map.insert("#n3","s3")
; map.insert("#nt","s4")
; map.insert("#n4","s4")
; map.insert("#nd","s5")
; map.insert("#n5","s5")
; map.insert("#nh","s6")
; map.insert("#n6","s6")
; map.insert("#nn","s7")
; map.insert("#n7","s7")
; map.insert("#ne","s8")
; map.insert("#n8","s8")
; map.insert("#ni","s9")
; map.insert("#n9","s9")
; map.insert("#no","s10")
; map.insert("#n0","s10")
; map.insert("#n-","s11")
; map.insert("#n'","s11")
; map.insert("#n=","s12")
; map.insert("#n\","s12")
; map.insert("#n.","SAPGuiToolTips")
; map.insert("#n,","alvToolbarClick")
; map.insert("#nq","CursorUpperLeftCorner")
; map.insert("#nw","CursorLowerLeftCorner")
; map.insert("#nf","CursorLowerRightCorner")
; map.insert("#np","CursorUpperRightCorner")
; map.insert("#nz","AppUpperLeftCorner")
; map.insert("#nx","AppLowerLeftCorner")
; map.insert("#nc","AppLowerRightCorner")
; map.insert("#nv","AppUpperRightCorner")
prefixKey("#n",map)
return

Copy() {
    send ^c
}

Paste() {
    send ^v
}

SwitchTab(){
    send !{tab}
}

_Tab(){
    send {tab}
}

; $^'::
; map:=Object()
; map.insert("^'a","a")
; map.insert("^'b","b")
; map.insert("^'c","c")
; map.insert("^'d","d")
; map.insert("^'e","e")
; map.insert("^'f","f")
; map.insert("^'g","g")
; map.insert("^'h","h")
; map.insert("^'i","i")
; map.insert("^'j","j")
; map.insert("^'k","k")
; map.insert("^'l","l")
; map.insert("^'m","m")
; map.insert("^'n","n")
; map.insert("^'o","o")
; map.insert("^'p","p")
; map.insert("^'q","q")
; map.insert("^'r","r")
; map.insert("^'s","s")
; map.insert("^'t","t")
; map.insert("^'u","u")
; map.insert("^'v","v")
; map.insert("^'w","w")
; map.insert("^'x","x")
; map.insert("^'y","y")
; map.insert("^'z","z")
; prefixKey("^'",map)
; return

$^e::
map:=Object()
map.insert("^ea","a")
map.insert("^eb","b")
map.insert("^ec","c")
map.insert("^ed","d")
map.insert("^ee","e")
map.insert("^ef","f")
map.insert("^eg","g")
map.insert("^eh","h")
map.insert("^ei","i")
map.insert("^ej","j")
map.insert("^ek","k")
map.insert("^el","l")
map.insert("^em","m")
map.insert("^en","n")
map.insert("^eo","o")
map.insert("^ep","p")
map.insert("^eq","q")
map.insert("^er","r")
map.insert("^es","s")
map.insert("^et","t")
map.insert("^eu","u")
map.insert("^ev","v")
map.insert("^ew","w")
map.insert("^ex","x")
map.insert("^ey","y")
map.insert("^ez","z")
prefixKey("^e",map)
return

a(){
	_jump_to_literal_sap("a")
}

b(){
	_jump_to_literal_sap("b")
}

c(){
	_jump_to_literal_sap("c")
}

d(){
	_jump_to_literal_sap("d")
}

e(){
	_jump_to_literal_sap("e")
}

f(){
	_jump_to_literal_sap("f")
}

g(){
	_jump_to_literal_sap("g")
}

h(){
	_jump_to_literal_sap("h")
}

i(){
	_jump_to_literal_sap("i")
}

j(){
	_jump_to_literal_sap("j")
}

k(){
	_jump_to_literal_sap("k")
}

l(){
	_jump_to_literal_sap("l")
}

m(){
	_jump_to_literal_sap("m")
}

n(){
	_jump_to_literal_sap("n")
}

o(){
	_jump_to_literal_sap("o")
}

p(){
	_jump_to_literal_sap("p")
}

q(){
	_jump_to_literal_sap("q")
}

s(){
	_jump_to_literal_sap("s")
}

t(){
	_jump_to_literal_sap("t")
}

u(){
	_jump_to_literal_sap("u")
}

v(){
	_jump_to_literal_sap("v")
}

w(){
	_jump_to_literal_sap("w")
}

x(){
	_jump_to_literal_sap("x")
}

y(){
	_jump_to_literal_sap("y")
}

z(){
	_jump_to_literal_sap("z")
}

alvToolbarClick(){
	Run, C:\Users\guenterc\Dropbox\Arbeit\10_SAP_Gui_Scripts\Buttons.vbs
}

RCTRL & m::
map:=Object()
map.insert("!mx","CenterCurrentWindow")
map.insert("!mr","Move_Window_2_3_left")
map.insert("!ms","Move_Window_1_3_left")
map.insert("!mt","Move_Window_1_3_right")
map.insert("!md","Move_Window_2_3_right")
prefixKey("!r",map)
return

RALT & r::
map:=Object()
map.insert("!rx","CenterCurrentWindow")
map.insert("!rr","Move_Window_2_3_left")
map.insert("!rs","Move_Window_1_3_left")
map.insert("!rt","Move_Window_1_3_right")
map.insert("!rd","Move_Window_2_3_right")
prefixKey("!r",map)
return

CenterCurrentWindow() 
{
	WinGetTitle, Title, A
	CenterWindow(Title)
}

CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
}

Move_Window_2_3_left()
{
	WinGetTitle, WinTitle, A
    WinMove, %WinTitle%,, 0, 0, (A_ScreenWidth/3*2), (A_ScreenHeight-40)
}

Move_Window_1_3_right()
{
	WinGetTitle, WinTitle, A
    WinMove, %WinTitle%,, (A_ScreenWidth/3*2), 0, (A_ScreenWidth/3*1), (A_ScreenHeight-40)
}

Move_Window_2_3_right()
{
	WinGetTitle, WinTitle, A
    WinMove, %WinTitle%,, (A_ScreenWidth/3*1), 0, (A_ScreenWidth/3*2), (A_ScreenHeight-40)
}

Move_Window_1_3_left()
{
	WinGetTitle, WinTitle, A
    WinMove, %WinTitle%,, 0, 0, (A_ScreenWidth/3*1), (A_ScreenHeight-40)
}

_sap_adresszeile_n(){
	_in_adresszeile_springen()
	sendinput n
}

_sap_adresszeile_o(){
	_in_adresszeile_springen()
	sendinput o
}

RALT & s::
map:=Object()
map.insert("!syiw","yiw")
map.insert("!syi'","yi_high_comma")
map.insert("!syiu","yi_bracket")
map.insert("!syiy","yi_bracket")
map.insert("!syi2","yi_quote")
map.insert("!syiv","yi_curlybrackets")
map.insert("!syib","yi_curlybrackets")
map.insert("!syik","yi_squarebrackes")
map.insert("!syim","yi_squarebrackes")
map.insert("!sc","watchcaret")
prefixKey("!s",map)
return

watchCaret(){
#Persistent
SetTimer, _WatchCaret, 100
return	
}
_WatchCaret:
  ToolTip, X%A_CaretX% Y%A_CaretY%, A_CaretX, A_CaretY - 20
return

yiw(){
	send ^{Left}
	Sleep, 50
	send ^+{right}
	sleep, 50
	send ^c
	Sleep, 50
	send ^{Left}
	return
}

yi_generic(openingKey,closingKey){
	X = %A_CaretX%	
	Y = %A_CaretY%

	send {home}
	send +{end}
	send ^c
	text = %Clipboard%
	startPosition := InStr(text,openingKey) + 1
	endPosition := InStr(text,closingKey,,startPosition)
	Clipboard := substr(text,startPosition,endPosition-startPosition)	
	send {home}
	
	startPosition := startPosition - 1
	return
}

yi_high_comma(){
	yi_generic("'","'")
}

yi_quote(){
	yi_generic("""","""")
}

yi_bracket(){
	yi_generic("(",")")
}

yi_curlybrackets(){
	yi_generic("{","}")
}

yi_squarebrackes(){
	yi_generic("[","]")
}

Ralt & d:: 
map:=Object()
map.insert("!dd","vim_register_clipboard")
prefixKey("!d",map)
return

vim_register_clipboard(){
	send "{+}
}

test(){
	MsgBox, Test
}

; ToolTip
#Include, C:\Users\guenterc\Downloads\_Struct.ahk
Struct(Structure,pointer=0,init=0){ 
return new _Struct(Structure,pointer,init)
}
#Include, C:\Users\guenterc\Downloads\TT.ahk

SAPGuiToolTips(){
	WinGetActiveTitle, title
	count := 0
	tooltips := Object()
	WinGet, ActiveControlList, ControlList, A
	Loop, Parse, ActiveControlList, `n
	{
		FoundPos := RegExMatch(A_LoopField, "Button.*")
		if (FoundPos != 0)
		{
			count := count + 1
			ControlGetPos, x, y, Width, Height,  %A_LoopField%, %title%
	 		y := y - 25 
			TT:=TT()
			TT.Show(count, x, y)
			tooltips.insert(TT)
		}
	}

	InputBox, input
	if !ErrorLevel
	{
		contr := "Button" + input
		ControlClick, %contr%, %title%
		send {enter}
	}

	for index, element in tooltips
	{
		element.remove()
	}
	return
}

#r::
click, right
click, right
return

; #d::
; TT:=TT("text","Title") ;create a ToolTip
; Loop 50 {
;    TT.Show() ;show ToolTip at mouse coordinates
;    Sleep, 50
; }
; TT.Remove() ;delete ToolTip
; return

#d::
Run  "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ,, max
Sleep,  100
WinMaximize, Neuer Tab - Google Chrome
return

;move mouse to the middle of monitor after tab switch with alt Tab
moveMouseToScreen(){ 
    global saveMousePositionForTitle

    sleep 100

    WinGetTitle, title, A

    oldPosition := saveMousePositionForTitle[title]
    if (oldPosition[1] > 0){
        x := oldPosition[1]
        y := oldPosition[2]
    } else {
        x:=20 
        y:=200 
    }

    MouseMove,x,y,
}

saveMousePosForTitle(){
    global saveMousePositionForTitle

    if !saveMousePositionForTitle{
        saveMousePositionForTitle := Object()
    }
    
    saveLastWindowOnScreen()

    WinGetTitle, title, A

    MouseGetPos, x, y
    saveMousePositionForTitle[title] := [x, y]
}

~!Tab::
saveMousePosForTitle()
KeyWait, Alt
KeyWait, Tab
moveMouseToScreen()
return

GetMonitorIndexFromWindow(windowHandle)
{
	monitorIndex := 1

	VarSetCapacity(monitorInfo, 40)
	NumPut(40, monitorInfo)
	
	if (monitorHandle := DllCall("MonitorFromWindow", "uint", windowHandle, "uint", 0x2)) 
		&& DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo) 
	{
		monitorLeft   := NumGet(monitorInfo,  4, "Int")
		monitorTop    := NumGet(monitorInfo,  8, "Int")
		monitorRight  := NumGet(monitorInfo, 12, "Int")
		monitorBottom := NumGet(monitorInfo, 16, "Int")
		workLeft      := NumGet(monitorInfo, 20, "Int")
		workTop       := NumGet(monitorInfo, 24, "Int")
		workRight     := NumGet(monitorInfo, 28, "Int")
		workBottom    := NumGet(monitorInfo, 32, "Int")
		isPrimary     := NumGet(monitorInfo, 36, "Int") & 1

		SysGet, monitorCount, MonitorCount

		Loop, %monitorCount%
		{
			SysGet, tempMon, Monitor, %A_Index%

			; Compare location to determine the monitor index.
			if ((monitorLeft = tempMonLeft) and (monitorTop = tempMonTop)
				and (monitorRight = tempMonRight) and (monitorBottom = tempMonBottom))
			{
				monitorIndex := A_Index
				break
			}
		}
	}
	
	return %monitorIndex%
}

getCurrentMonitor(){
    WinGet, winid,,A
    index := GetMonitorIndexFromWindow(winid)
    return index
}


saveLastWindowOnScreen(){
    global lastWindowOnScreen

    if !lastWindowOnScreen {
        lastWindowOnScreen := Array()
    }

    WinGetTitle, title, A

    currentMonitor := getCurrentMonitor()
    lastWindowOnScreen[currentMonitor] := title
}

activateWindowOnScreen(screen){
    saveLastWindowOnScreen()

    global lastWindowOnScreen

    title := lastWindowOnScreen[screen]
    WinActivate, %title%
}

activateWindowOnScreenOne(){
    activateWindowOnScreen(1)
}

activateWindowOnScreenTwo(){
    activateWindowOnScreen(2)
}

activateWindowOnScreenThree(){
    activateWindowOnScreen(3)
}

GetMonitorMsg(){
    index := getCurrentMonitor()
    MsgBox %index%
}

testGlobalVar(){
    global counter 
    if !counter {
        counter := 10
    }
    counter := counter + 1
    msgbox % counter
}

RapidHotkey(keystroke, times="2", delay=0.1, IsLabel=0)
{
	Pattern := Morse(delay*1000)
	If (StrLen(Pattern) < 2 and Chr(Asc(times)) != "1")
		Return
	If (times = "" and InStr(keystroke, """"))
	{
		Loop, Parse, keystroke,""	
			If (StrLen(Pattern) = A_Index+1)
				continue := A_Index, times := StrLen(Pattern)
	}
	Else if (RegExMatch(times, "^\d+$") and InStr(keystroke, """"))
	{
		Loop, Parse, keystroke,""
			If (StrLen(Pattern) = A_Index+times-1)
				times := StrLen(Pattern), continue := A_Index
	}
	Else if InStr(times, """")
	{
		Loop, Parse, times,""
			If (StrLen(Pattern) = A_LoopField)
				continue := A_Index, times := A_LoopField
	}
	Else if (times = "")
		continue := 1, times := 2
	Else if (times = StrLen(Pattern))
		continue = 1
	If !continue
		Return
	Loop, Parse, keystroke,""
		If (continue = A_Index)
			keystr := A_LoopField
	Loop, Parse, IsLabel,""
		If (continue = A_Index)
			IsLabel := A_LoopField
	hotkey := RegExReplace(A_ThisHotkey, "[\*\~\$\#\+\!\^]")
	IfInString, hotkey, %A_Space%
		StringTrimLeft, hotkey,hotkey,% InStr(hotkey,A_Space,1,0)
	backspace := "{BS " times "}"
	keywait = Ctrl|Alt|Shift|LWin|RWin
	Loop, Parse, keywait, |
		KeyWait, %A_LoopField%
	If ((!IsLabel or (IsLabel and IsLabel(keystr))) and InStr(A_ThisHotkey, "~") and !RegExMatch(A_ThisHotkey
	, "i)\^[^\!\d]|![^\d]|#|Control|Ctrl|LCtrl|RCtrl|Shift|RShift|LShift|RWin|LWin|Alt|LAlt|RAlt|Escape|BackSpace|F\d\d?|"
	. "Insert|Esc|Escape|BS|Delete|Home|End|PgDn|PgUp|Up|Down|Left|Right|ScrollLock|CapsLock|NumLock|AppsKey|"
	. "PrintScreen|CtrlDown|Pause|Break|Help|Sleep|Browser_Back|Browser_Forward|Browser_Refresh|Browser_Stop|"
	. "Browser_Search|Browser_Favorites|Browser_Home|Volume_Mute|Volume_Down|Volume_Up|MButton|RButton|LButton|"
	. "Media_Next|Media_Prev|Media_Stop|Media_Play_Pause|Launch_Mail|Launch_Media|Launch_App1|Launch_App2"))
		Send % backspace
	If (WinExist("AHK_class #32768") and hotkey = "RButton")
		WinClose, AHK_class #32768
	If !IsLabel
		Send % keystr
	else if IsLabel(keystr)
		Gosub, %keystr%
	Return
}	
Morse(timeout = 400) { ;by Laszo -> http://www.autohotkey.com/forum/viewtopic.php?t=16951 (Modified to return: KeyWait %key%, T%tout%)
   tout := timeout/1000
   key := RegExReplace(A_ThisHotKey,"[\*\~\$\#\+\!\^]")
   IfInString, key, %A_Space%
		StringTrimLeft, key, key,% InStr(key,A_Space,1,0)
	If Key in Shift,Win,Ctrl,Alt
		key1:="{L" key "}{R" key "}"
   Loop {
      t := A_TickCount
      KeyWait %key%, T%tout%
		Pattern .= A_TickCount-t > timeout
		If(ErrorLevel)
			Return Pattern
    If key in Capslock,LButton,RButton,MButton,ScrollLock,CapsLock,NumLock
      KeyWait,%key%,T%tout% D
    else if Asc(A_ThisHotkey)=36
		KeyWait,%key%,T%tout% D
    else
      Input,pressed,T%tout% L1 V,{%key%}%key1%
	If (ErrorLevel="Timeout" or ErrorLevel=1)
		Return Pattern
	else if (ErrorLevel="Max")
		Return
   }
}

; ~h::RapidHotkey("{Raw}Hello World!", 3) ;Press h 3 times rapidly to send Hello World!
~Capslock::RapidHotkey("{escape}", 2) 
~LControl::RapidHotkey("move_mouse_to_cursor",2,,1)
~RControl::RapidHotkey("move_mouse_to_cursor",2,,1)
move_mouse_to_cursor:
MouseMove, % A_CaretX, % A_CaretY 
return

; ~LControl & LShift::RapidHotkey("{Raw}ctrl + lshift",1)
; ~LAlt::RapidHotkey("{Raw}1231",2)
;~LShift::RapidHotkey("control_l",2,0.2,1)
;control_l:
;send ^l
;return

~RShift::RapidHotkey("control_l_n",2,0.2,1)
control_l_n:
send ^l
sleep 25
send n
return

~LWin::RapidHotkey("test123",2,,1)
test123:
msgbox Test
return

; ~.::RapidHotkey("{Raw}Test",2)
; ~a::RapidHotkey("{Raw}ä",2)
; ~u::RapidHotkey("{Raw}ü",2)
; ~o::RapidHotkey("{Raw}ö",2)


