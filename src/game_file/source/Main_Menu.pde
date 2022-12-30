void mainMenu() {
  background(bgColor);
  xCenter = width / 2;

  displayText("MATCHUS", 50, 0, textColor, textColor, xCenter, 230);

  rectMode(CENTER);
  displayRect(xCenter, 270, textWidth("MATCHUS"), 10, textColor, -1);

  cursor(ARROW);

  displayText("PLAY", 35, 5, textColor, primaryHoverColor, xCenter, 320);
  displayText("SETTINGS", 35, 5, textColor, primaryHoverColor, xCenter, 370);
  displayText("BEST RECORD", 35, 5, textColor, primaryHoverColor, xCenter, 420);

  displayText("EXIT", 35, 5, textColor, secondaryHoverColor, xCenter, 470);
}

void clickToExitGame(float yPos) {
  textSize(35);
  float halfExitText = textWidth("EXIT") / 2;
  if ((mouseX <= xCenter + halfExitText && mouseX >= xCenter -  halfExitText) &&
    (mouseY <= yPos + 15 && mouseY >= yPos - 15)) {
    exit();
  }
}

void mainMenuMouseClicked() {
  clickToRenderPage("GameMode", false, xCenter,
    320, textWidth("Play") / 2, 15);
  clickToRenderPage("SettingsPage", false, xCenter,
    370, textWidth("Settings") / 2, 15);
  clickToRenderPage("RecordPage", false, xCenter,
    420, textWidth("Best Record") / 2, 15);
  clickToExitGame(470);
}
