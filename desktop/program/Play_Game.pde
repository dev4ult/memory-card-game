void playGame() {
  background(bgColor);
  displayText("Choose and Match the card", 25, 0, textColor, textColor, xCenter, 75);
  displayText("menu", 25, 5, textColor, secondaryHoverColor, 75, 765);
  
  rectMode(CENTER);
  for(int i = 140; i <= 860; i = i + 240) {
    displayRect(i, 300, 200, 250, textColor, #ffffff);
  }
  displayTime();
  
  pushMatrix();
  translate(100, 125);
  rotate(PI / 2);
  displayRect(0, 0, 200, 250, textColor, #ffffff);
  popMatrix();
}

void displayTime() {
  int m = second();
  displayText("Time:" + m, 25, 0, textColor, textColor, 500, 765);
}

void playGameMouseClicked() {
 if (page == "PlayGame") {
    clickToRenderPage("MainMenu", false, 75, 
                       780, textWidth("menu") / 2, 15);
                      
  } 
}
