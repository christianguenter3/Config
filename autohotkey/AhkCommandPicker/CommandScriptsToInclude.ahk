;====================================================================
; Include our utility functions used by some of the Commands first.
;====================================================================
#Include C:\Users\christian.guenter\Documents\GIT\Config\autohotkey\AhkCommandPicker\Commands\UtilityFunctions.ahk


;====================================================================
; Include the files with the Commands we want to include in the picker.
; You can put all of your commands in a single file, or break them into
; separate files (e.g General.ahk, Work.ahk, Personal.ahk, HomePC.ahk, etc.).
;====================================================================
#Include C:\Users\christian.guenter\Documents\GIT\Config\autohotkey\AhkCommandPicker\Commands\DefaultCommands.ahk

#Include C:\Users\christian.guenter\Documents\GIT\Config\autohotkey\AhkCommandPicker\Commands\MyCommands.ahk


;====================================================================
; Include any files containing HotKeys/HotStrings last, as any AddCommand 
; functions defined after a HotKey/HotString won't be loaded at startup,
; and hence, won't show up in the Command Picker list.
;====================================================================
#Include C:\Users\christian.guenter\Documents\GIT\Config\autohotkey\AhkCommandPicker\Commands\DefaultHotkeys.ahk
#Include C:\Users\christian.guenter\Documents\GIT\Config\autohotkey\AhkCommandPicker\Commands\MyHotkeys.ahk
#Include C:\Users\christian.guenter\Documents\GIT\Config\autohotkey\AutoHotkey.ahk





	
