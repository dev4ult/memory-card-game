function card(xPos, yPos, cardWidth, cardHeight, colorFill, colorStroke) {
  noFill();
  noStroke();

  if (colorFill != null) {
    fill(colorFill);
  }

  if (colorStroke != null) {
    stroke(colorStroke);
  }

  rect(xPos, yPos, cardWidth, cardHeight);
}
