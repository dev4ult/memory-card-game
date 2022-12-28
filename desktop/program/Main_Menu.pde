void mainMenu() {
  background(bgColor);
  xCenter = width / 2;
  
  displayText("MATCH US", 50, 0, textColor, textColor, xCenter, 230);
  rectMode(CENTER);
  displayRect(xCenter, 270, textWidth("MATCH US"), 10, textColor, -1);
  
  displayText("Play Game", 35, 5, textColor, primaryHoverColor, xCenter, 320);
  displayText("Settings", 35, 5, textColor, primaryHoverColor, xCenter, 370);
  
  displayText("exit", 35, 5, textColor, secondaryHoverColor, xCenter, 420);
}

void clickToExitGame() {
  textSize(35);
  float halfExitText = textWidth("Exit") / 2;
  if((mouseX <= xCenter + halfExitText && mouseX >= xCenter -  halfExitText) && 
     (mouseY <= 420 + 20 && mouseY >= 420 - 20)) {
    exit();    
  }  
}

void mainMenuMouseClicked() {
  if(page == "MainMenu") {
    clickToRenderPage("PlayGame", false, xCenter, 
                       320, textWidth("Play Game") / 2, 20);    
    clickToRenderPage("SettingsPage", false, xCenter, 
                       370, textWidth("Settings") / 2, 20);
    clickToExitGame();
  }
}
