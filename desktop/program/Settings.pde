void settingsPage() {
   background(bgColor);
   displayText("Settings", 50, 0, textColor, textColor, xCenter, 230);
   displayText("Theme:" + theme, 25, 5, textColor, primaryHoverColor, xCenter, 300);
   displayText("Back", 25, 5, textColor, secondaryHoverColor, xCenter, 350);
}

void settingsPageMouseClicked() {
   if(page == "SettingsPage") {
     clickToRenderPage("SettingsPage", true, xCenter, 
                       300, textWidth("Theme:" + theme) / 2, 15);
     clickToRenderPage("MainMenu", false, xCenter, 
                       360, textWidth("back") / 2, 15);  
   }        
}
