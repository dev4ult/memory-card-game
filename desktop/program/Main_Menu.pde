
void mainMenu() {
  background(bgColor);
  xCenter = width / 2;
  
  displayText("MATCH US", 50, 0, textColor, textColor, xCenter, 230);
  rectMode(CENTER);
  noStroke();
  fill(textColor);
  rect(xCenter, 240, textWidth("MATCH US"), 10);
  
  displayText("New Game", 35, 5, textColor, primaryHoverColor, xCenter, 320);
  displayText("Settings", 35, 5, textColor, primaryHoverColor, xCenter, 370);
}
