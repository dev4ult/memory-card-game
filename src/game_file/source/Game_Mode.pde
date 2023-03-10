String gameModeName;
int totalCardType;
float xPosStart, yPosStart, xRange, yRange, xLimit, yLimit, halfWidthRect, halfHeightRect;

void gameMode() {
  background(bgColor);

  displayText("Game Mode", 50, 0, textColor, textColor, xCenter, 230);
  displayText("EASY", 35, 5, textColor, primaryHoverColor, xCenter, 300);
  displayText("NORMAL", 35, 5, textColor, primaryHoverColor, xCenter, 350);
  displayText("HARD", 35, 5, textColor, primaryHoverColor, xCenter, 400);
  displayText("MENU", 35, 5, textColor, secondaryHoverColor, xCenter, 470);
}

void gameModeMouseClicked() {
  setGameStart(300, "EASY");
  setGameStart(350, "NORMAL");
  setGameStart(400, "HARD");

  clickToRenderPage("PlayGame", false, xCenter,
    300, textWidth("EASY") / 2, 20);
  clickToRenderPage("PlayGame", false, xCenter,
    350, textWidth("NORMAL") / 2, 20);
  clickToRenderPage("PlayGame", false, xCenter,
    400, textWidth("HARD") / 2, 20);

  clickToRenderPage("MainMenu", false, xCenter,
    470, textWidth("MENU") / 2, 20);
}

void setGameMode(int totalCard, float xPos, float yPos, float xRangeCenter, float yRangeCenter, float xLimitRange, float yLimitRange, float halfWidth, float halfHeight) {
    xPosStart = xPos;
    yPosStart = yPos;
    xRange = xRangeCenter;
    yRange = yRangeCenter;
    xLimit = xLimitRange;
    yLimit = yLimitRange;
    halfWidthRect = halfWidth;
    halfHeightRect = halfHeight;
    totalCardType = totalCard;
}