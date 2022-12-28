function objectOver(xPos, yPos, halfWidth, halfHeight, callbackFunc) {
  let leftRange = xPos + halfSketchWidth + halfWidth;
  let rightRange = xPos + halfSketchWidth - halfWidth;
  let topRange = yPos + halfSketchHeight + halfHeight;
  let bottomRange = yPos + halfSketchHeight - halfHeight;
  if (mouseX <= leftRange && mouseX >= rightRange && mouseY <= topRange && mouseY >= bottomRange) {
    callbackFunc();
  }
}

function textAsButton(textStr, size, scaleSize, fillColor, hoverFill, xPos, yPos) {
  fill(fillColor);
  textSize(size);
  cursor(ARROW);

  objectOver(xPos, yPos, textWidth(textStr) / 2, size / 2, () => {
    fill(hoverFill);
    textSize(size + scaleSize);
    cursor(HAND);
  });

  text(textStr, xPos, yPos);
}

function mainMenu() {
  background(30);

  textAlign(CENTER, CENTER);
  textAsButton('ayam gaming', 35, 5, 200, 200, 0, -150);
}
