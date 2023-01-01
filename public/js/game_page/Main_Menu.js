function Main_Menu() {
  background(bgColor);
  cursor(ARROW);

  textSize(textXL);
  fill(textColor);
  text('MATCH US', 0, -150);

  textButton('-PLAY-', textMedium, 5, textColor, primaryHoverColor, 0, -80);
  textButton('SETTINGS', textMedium, 5, textColor, primaryHoverColor, 0, -30);
  textButton('BEST RECORD', textMedium, 5, textColor, primaryHoverColor, 0, 20);
}

function mainMenuMouseClicked() {
  textSize(textMedium);

  objectOver(0, -80, textWidth('-PLAY-') / 2, textMedium / 2, () => {
    tick.play();
    page = 'GameMode';
  });

  objectOver(0, -30, textWidth('Settings') / 2, textMedium / 2, () => {
    tick.play();
    page = 'Settings';
  });

  objectOver(0, 20, textWidth('Settings') / 2, textMedium / 2, () => {
    tick.play();
    loadBestTime();
    page = 'GameRecord';
  });
}
