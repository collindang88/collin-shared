#Requires AutoHotkey v2.0
#SingleInstance Force

; Alt+;  ->  focus the MAIN ChatGPT window (never the companion window)
!vkBA::OpenMainChatGPT()

OpenMainChatGPT() {
    ; Stable across app updates (no version number in the AppID)
    static APP_ID := "OpenAI.ChatGPT-Desktop_2p2nqsd0c76g0!ChatGPT"

    hwnd := FindMainChatGPTWindow()
    if hwnd {
        if WinActive("ahk_id " hwnd) {         ; already focused -> toggle: minimize
            WinMinimize "ahk_id " hwnd
            return
        }
        if WinGetMinMax("ahk_id " hwnd) = -1   ; only un-minimize; keep maximized state
            WinRestore "ahk_id " hwnd
        WinActivate "ahk_id " hwnd
        return
    }

    ; Nothing on screen (app is in the tray) -> summon it; the running
    ; single instance brings its MAIN window forward.
    Run 'explorer.exe shell:AppsFolder\' APP_ID
}

FindMainChatGPTWindow() {
    bestHwnd := 0, bestArea := 0
    for hwnd in WinGetList("ahk_exe ChatGPT.exe") {
        try {
            ; Real UI windows are Chrome_WidgetWin_1; helper windows are _0.
            if WinGetClass("ahk_id " hwnd) != "Chrome_WidgetWin_1"
                continue
            ; The companion window is always-on-top (WS_EX_TOPMOST 0x8)
            ; and has no maximize box (WS_MAXIMIZEBOX 0x10000). The main
            ; window is the opposite -> use that to exclude the companion.
            if (WinGetExStyle("ahk_id " hwnd) & 0x8)
                continue
            if !(WinGetStyle("ahk_id " hwnd) & 0x10000)
                continue
            WinGetPos , , &w, &h, "ahk_id " hwnd
            area := w * h
            if (area >= bestArea) {     ; tie-break if several main windows
                bestArea := area
                bestHwnd := hwnd
            }
        }
    }
    return bestHwnd
}
