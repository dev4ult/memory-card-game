boolean newRecord;

void winGame() {
  background(bgColor);
  displayText("Congratulation", 50, 0, textColor, textColor, xCenter, 150);
  displayText("On winning", 50, 0, textColor, textColor, xCenter, 200);
  displayRecordTime();

  displayText("PLAY AGAIN", 35, 5, textColor, primaryHoverColor, xCenter, 330);
  displayText("MENU", 35, 5, textColor, primaryHoverColor, xCenter, 380);
}

void displayRecordTime() {
  if (newRecord) {
    displayText("NEW RECORD TIME - " + timeText, 25, 0, textColor, textColor, xCenter, 265);
  } else {
    displayText("TIME - " + timeText, 25, 0, textColor, textColor, xCenter, 265);
    displayText("BEST TIME - " + modeBT, 25, 0, textColor, textColor, xCenter, 450);
  }
}

void winGameMouseClicked() {
  setGameStart(330, gameModeName);
  
  clickToRenderPage("PlayGame", false, xCenter,
    330, textWidth("PLAY AGAIN") / 2, 20);
    
  clickToRenderPage("MainMenu", false, xCenter,
    380, textWidth("MENU") / 2, 20);
}
