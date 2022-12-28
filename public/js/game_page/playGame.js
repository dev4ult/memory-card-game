function playGame() {
  background(bgColor);
  cursor(ARROW);

  textSize(20);
  fill(textColor);
  text('match the card', 0, 30 - halfSketchHeight);

  textButton('menu', 20, 5, textColor, secondaryHoverColor, 60 - halfSketchWidth, halfSketchHeight - 30);
}

function playGameMouseClicked() {
  textSize(25);

  objectOver(60 - halfSketchWidth, halfSketchHeight - 30, textWidth('menu') / 2, 12.5, () => {
    page = 'MainMenu';
  });
}
