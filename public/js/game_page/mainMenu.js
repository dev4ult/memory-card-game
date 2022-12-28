function mainMenu() {
  background(bgColor);
  cursor(ARROW);

  textAlign(CENTER, CENTER);
  textSize(50);
  fill(textColor);
  text('MATCH US', 0, -150);

  textButton('-Play-', 35, 5, textColor, primaryHoverColor, 0, -80);
  textButton('Settings', 35, 5, textColor, primaryHoverColor, 0, -30);
}

function mainMenuMouseClicked() {
  textSize(40);

  objectOver(0, -80, textWidth('-Play-') / 2, 20, () => {
    page = 'PlayGame';
  });

  objectOver(0, -30, textWidth('Settings') / 2, 20, () => {
    page = 'Settings';
  });
}
