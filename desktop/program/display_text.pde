void displayText(String text, int textSize, int scaleSize, int regularColor,
  int colorOnHover, float xPos, float yPos) {

  textAlign(CENTER, CENTER);
  textSize(textSize);

  float halfTextWidth = textWidth(text) / 2;
  float halfTextHeight = textSize / 2;

  fill(regularColor);

  if ((mouseX <= xPos + halfTextWidth &&
    mouseX >= xPos -  halfTextWidth) &&
    (mouseY <= yPos + halfTextHeight && mouseY >= yPos - halfTextHeight)) {
    textSize(textSize + scaleSize);

    fill(colorOnHover);
  }

  text(text, xPos, yPos);
}
