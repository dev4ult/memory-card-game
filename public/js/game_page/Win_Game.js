function Win_Game() {
  background(bgColor);
  cursor(ARROW);

  textSize(textXL);
  fill(textColor);
  text('Settings', 0, -150);

  displayBestTime();

  textButton('PLAY AGAIN', textMedium, 5, textColor, primaryHoverColor, 0, 0);
  textButton('-MENU-', textMedium, 5, textColor, secondaryHoverColor, 0, 50);
}

function displayBestTime() {
  textSize(textNormal);
  if (newRecord) {
    text('New Record : ' + timeAsText, 0, -80);
  } else {
    text('Time - ' + timeAsText, 0, -80);
    text('Best Time - ' + modeBT, 0, -50);
  }
}

function winGameMouseClicked() {
  textSize(textMedium);
  objectOver(0, 0, textWidth('PLAY AGAIN') / 2, textMedium / 2, () => {
    tick.play();
    setCardSizeAndPos(totalCardSymbol);
    page = 'PlayGame';
  });
  objectOver(0, 50, textWidth('-MENU-') / 2, textMedium / 2, () => {
    tick.play();
    page = 'MainMenu';
  });
}
