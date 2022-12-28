function textButton(textStr, size, scaleSize, fillColor, hoverFill, xPos, yPos) {
  fill(fillColor);
  textSize(size);

  objectOver(xPos, yPos, textWidth(textStr) / 2, size / 2, () => {
    fill(hoverFill);
    textSize(size + scaleSize);
    cursor(HAND);
  });

  text(textStr, xPos, yPos);
}
