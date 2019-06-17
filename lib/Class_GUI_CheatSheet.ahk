﻿class GUI_CheatSheet {

    Show(which) {
        global PROGRAM

        filePng := which="Betrayal"?"Betrayal.png"
        : which="Delve"?"Delve.png"
        : which="Essence"?"Essence.png"
        : which="Incursion"?"Incursion.png"
        : ""

        if (!filePng)
            return
            
        global GuiCheatSheet, GuiCheatSheet_Controls
        GUI_CheatSheet.Destroy()
        Gui.New("CheatSheet", "+AlwaysOnTop +ToolWindow +LastFound -SysMenu -Caption -Border +E0x08000000 +HwndhGuiCheatSheet", "POE TC - CheatSheet")
        Gui.Color("CheatSheet","EEAA99")
        WinSet, TransColor, EEAA99

        Gui.Add("CheatSheet", "Picture", "0xE BackgroundTrans hwndhIMG_CheatSheet")
        hBitMap := Gdip_CreateResizedHBITMAP_FromFile(PROGRAM.CHEATSHEETS_FOLDER "\" filePng, A_ScreenWidth*0.90, A_ScreenHeight*0.80, keepRatio:=True)
        SetImage(GuiCheatSheet_Controls.hIMG_CheatSheet, hBitmap)

        __f := GUI_CheatSheet.CheatSheetRemove.bind(GUI_CheatSheet)
        GuiControl, CheatSheet:+g,% GuiCheatSheet_Controls.hIMG_CheatSheet,% __f

        Gui.Show("CheatSheet", "xCenter yCenter AutoSize NoActivate")
    }

    CheatSheetRemove() {
        GUI_CheatSheet.Destroy()
    }

    Destroy() {
        Gui.Destroy("CheatSheet")
    }
}