
void mainMenu() {
  background(#0d0401);
  xCenter = width / 2;
  
  displayText("MATCH US", 50, 0, 255, 255, xCenter, 230);
  rectMode(CENTER);
  rect(xCenter, 240, textWidth("MATCH US"), 10);
  
  displayText("New Game", 35, 5, 255, #87f49a, xCenter, 320);
  displayText("Settings", 35, 5, 255, #87f49a, xCenter, 370);
}
