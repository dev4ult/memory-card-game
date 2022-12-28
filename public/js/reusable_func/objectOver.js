function objectOver(xPos, yPos, halfWidth, halfHeight, callbackFunc) {
  let leftRange = xPos + halfSketchWidth + halfWidth;
  let rightRange = xPos + halfSketchWidth - halfWidth;
  let topRange = yPos + halfSketchHeight + halfHeight;
  let bottomRange = yPos + halfSketchHeight - halfHeight;
  if (mouseX <= leftRange && mouseX >= rightRange && mouseY <= topRange && mouseY >= bottomRange) {
    callbackFunc();
  }
}
