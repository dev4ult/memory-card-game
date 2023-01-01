function Game_Mode() {
  background(bgColor);
  cursor(ARROW);

  textSize(textLarge);
  fill(textColor);
  text('Game Mode', 0, -150);

  textButton('EASY', textMedium, 5, textColor, primaryHoverColor, 0, -80);
  textButton('NORMAL', textMedium, 5, textColor, primaryHoverColor, 0, -30);
  textButton('HARD', textMedium, 5, textColor, primaryHoverColor, 0, 20);

  textButton('-MENU-', textMedium, 5, textColor, secondaryHoverColor, 0, 90);
}

let totalCardSymbol;
let cardWidth, cardHeight, xPosStart, yPosStart, xRange, yRange;
let rotateStatus, isFaceUp, cardYAngle, isAbleToRotate, zPos;

function setCardSizeAndPos(totalCardType) {
  totalCardSymbol = totalCardType;
  let totalGap = totalCardType + 1;

  xPosStart = -(width * (totalCardType - 1)) / (2 * totalCardType) + width / (totalGap * totalGap * 2) - totalGap;
  yPosStart = -height / 4 + 8 + 30;
  xRange = (width * (totalGap + 1)) / (totalGap * totalGap);
  yRange = (7 * height) / 16 - 45 + width / (totalGap * totalGap);
  cardWidth = width / totalGap;
  cardHeight = (7 * height) / 16 - 45;

  gameStart = true;

  startTime = millis();
  runningMinute = 0;
  runningSecond = 0;
  rotateInterval = 10;

  rotateStatus = new Array();
  isFaceUp = new Array();
  cardYAngle = new Array();
  isAbleToRotate = new Array();
  zPos = new Array();

  loadAssets();
  shuffleCard();

  for (let i = 0; i < 2; i++) {
    rotateStatus.push(new Array());
    isFaceUp.push(new Array());
    cardYAngle.push(new Array());
    isAbleToRotate.push(new Array());
    zPos.push(new Array());
    for (let j = 0; j < totalCardType; j++) {
      rotateStatus[i][j] = false;
      isFaceUp[i][j] = true;
      cardYAngle[i][j] = 0;
      isAbleToRotate[i][j] = false;
      zPos[i][j] = 1;
    }
  }
}

let gameModeName;

function gameModeMouseClicked() {
  objectOver(0, -80, textWidth('EASY') / 2, textMedium / 2, () => {
    tick.play();
    setCardSizeAndPos(4);
    gameModeName = 'EASY';
    page = 'PlayGame';
  });
  objectOver(0, -30, textWidth('NORMAL') / 2, textMedium / 2, () => {
    tick.play();
    setCardSizeAndPos(5);
    gameModeName = 'NORMAL';
    page = 'PlayGame';
  });
  objectOver(0, 20, textWidth('HARD') / 2, textMedium / 2, () => {
    tick.play();
    setCardSizeAndPos(6);
    gameModeName = 'HARD';
    page = 'PlayGame';
  });

  objectOver(0, 90, textWidth('-MENU-') / 2, textMedium / 2, () => {
    tick.play();
    page = 'MainMenu';
  });
}
