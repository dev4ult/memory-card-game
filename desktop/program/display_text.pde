void displayText(String text, int textSize, int scaleSize, int regularColor, 
                 int colorOnHover, float xPos, float yPos) {
  textSize(textSize);
  float halfTextWidth = textWidth(text) / 2;
  
  textSize(textSize);
  fill(regularColor);
  
  if((mouseX <= xCenter + halfTextWidth && 
     mouseX >= xCenter -  halfTextWidth) && 
     (mouseY <= yPos && mouseY >= yPos - textSize)) {
    textSize(textSize + scaleSize);
    
    fill(colorOnHover);
  }
  
  text(text, xPos, yPos);
}
