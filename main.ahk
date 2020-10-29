#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

CoordMode, Pixel, Client
CoordMode, Mouse, Client

choiceX := 275
choiceY := 607

choiceXColor := 275
choiceYColor := 683

Esc::ExitApp ; press escape to exit

F1::
Loop 999 { ; change to number of questions or just press escape to exit
    Send {End}
    Sleep, 200 ; to delay click to after scroll animation finishes
    Loop 4 {
        MouseClick, left, choiceX, choiceY ; click first answer
        MouseClick, left, 1737, 152 ; click check answer button
        Sleep, 300 ; to delay color getter for correctness animation
        PixelGetColor, color, choiceXColor, choiceYColor ; get color indicating first answer correctness
        If (color = 0xF5F9F6) { ; if answer is correct (green)
            MouseClick, left, 1150, 1029 ; go to next question
            break ; end loop
        } else {
            choiceY += 91
            choiceYColor += 89
            Click, 1730, 202 ; click return to question
        }
    }
    choiceY := 607
    choiceYColor := 683
    Sleep, 500
}