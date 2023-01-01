function Game_Record() {
  background(bgColor);
  cursor(ARROW);

  textSize(textXL);
  fill(textColor);
  text('Best Record', 0, -150);

  textSize(textMedium);
  text('EASY - ' + recordBestTime['easy'], 0, -80);
  text('NORMAL - ' + recordBestTime['normal'], 0, -20);
  text('HARD - ' + recordBestTime['hard'], 0, 40);

  textButton('MENU', textMedium, 5, textColor, secondaryHoverColor, 0, 100);
}

function gameRecordMouseClicked() {
  textSize(textMedium);
  objectOver(0, 100, textWidth('MENU') / 2, textMedium / 2, () => {
    tick.play();
    page = 'MainMenu';
  });
}
