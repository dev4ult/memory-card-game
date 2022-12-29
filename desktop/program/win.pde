void winPage() {
    background(bgColor);
    displayText("Congratulations you win the game ", 30, 0, textColor, textColor, xCenter, 230);
    displayText("Play Again", 30, 5, textColor, primaryHoverColor, xCenter, 320);
    displayText("Main Menu", 30, 5, textColor, primaryHoverColor, xCenter, 370);  
    displayText("exit", 30, 5, textColor, secondaryHoverColor, xCenter, 420);
}

void winPageMouseClicked() {
    if (page == "WinPage"){
      clickToRenderPage("PlayGame", false, xCenter, 
                         320, textWidth("Play Game") / 2, 20);    
      clickToRenderPage("MainMenu", false, xCenter, 
                         370, textWidth("Settings") / 2, 20);
      clickToExitGame();
    }
}
