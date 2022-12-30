
void recordPage() {
  background(bgColor);
  displayText("Best Record", 50, 0, textColor, textColor, xCenter, 230);
  reloadBestTime();

  displayText("EASY - " + easyBT, 30, 0, textColor, textColor, xCenter, 300);
  displayText("NORMAL - " + normalBT, 30, 0, textColor, textColor, xCenter, 350);
  displayText("HARD - " + hardBT, 30, 0, textColor, textColor, xCenter, 400);

  displayText("MENU", 35, 5, textColor, secondaryHoverColor, xCenter, 460);
}

void recordPageMouseClicked() {
  clickToRenderPage("MainMenu", false, xCenter,
    480, textWidth("menu") / 2, 20);
}
