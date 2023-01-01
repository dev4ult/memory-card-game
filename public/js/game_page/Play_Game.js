function Play_Game() {
  background(bgColor);
  cursor(ARROW);

  waitToStartGame();
  waitAfterWin();

  textSize(textNormal);
  fill(textColor);
  text('Match All Cards', 0, 30 - halfSketchHeight);

  textButton('MENU', textNormal, 5, textColor, secondaryHoverColor, 70 - halfSketchWidth, 30 - halfSketchHeight);
  displayTimer();

  waitToFlipBack();
  setupAllRect();
}

function setupAllRect() {
  let xPos;
  let yPos = yPosStart;
  for (let i = 0; i < 2; i++) {
    xPos = xPosStart;
    for (let j = 0; j < totalCardSymbol; j++) {
      push();
      rectMode(CENTER);
      translate(xPos, yPos, zPos[i][j]);
      rotateY(radians(cardYAngle[i][j]));

      imageMode(CENTER);
      image(cardIdentity[i][j], 0, 0);

      translate(0, 0, -zPos[i][j]);
      card(0, 0, cardWidth, cardHeight, textColor, '#FFFFFF');
      pop();

      flipCard(i, j);
      xPos += xRange;
    }
    yPos += yRange;
  }
}

function setupCard() {
  for (let i = 0; i < 2; i++) {
    for (let j = 0; j < totalCardSymbol; j++) {
      rotateStatus[i][j] = true;
      isFaceUp[i][j] = false;
      isAbleToRotate[i][j] = true;
    }
  }
}

function resetCard() {
  for (let i = 0; i < 2; i++) {
    for (let j = 0; j < totalCardSymbol; j++) {
      rotateStatus[i][j] = false;
      isFaceUp[i][j] = false;
      isAbleToRotate[i][j] = true;
    }
  }
}

function viewAllCardSymbol() {
  for (let i = 0; i < 2; i++) {
    for (let j = 0; j < totalCardSymbol; j++) {
      isFaceUp[i][j] = true;
      isAbleToRotate[i][j] = false;
    }
  }
}

let rotateInterval = 10;

function flipCard(rowIndex, columnIndex) {
  if (rotateStatus[rowIndex][columnIndex]) {
    cardYAngle[rowIndex][columnIndex] += rotateInterval;
    if (cardYAngle[rowIndex][columnIndex] == 180 || cardYAngle[rowIndex][columnIndex] == 0) {
      rotateStatus[rowIndex][columnIndex] = false;
    }
    if (cardYAngle[rowIndex][columnIndex] == 180 && !isAbleToRotate[rowIndex][columnIndex]) {
      isAbleToRotate[rowIndex][columnIndex] = true;
      cardUp = -1;
    }
  }
}

function changeFlipDirection(rowIndex, columnIndex) {
  if (cardYAngle[rowIndex][columnIndex] == 0) {
    rotateInterval = 10;
  } else {
    rotateInterval = -10;
  }
}

function playGameMouseClicked() {
  let xPos;
  let yPos = yPosStart;
  for (let i = 0; i < 2; i++) {
    xPos = xPosStart;
    for (let j = 0; j < totalCardSymbol; j++) {
      clickToFlipTheCard(i, j, xPos, yPos, cardWidth / 2, cardHeight / 2);
      xPos += xRange;
    }
    yPos += yRange;
  }

  textSize(textNormal);

  objectOver(70 - halfSketchWidth, 30 - halfSketchHeight, textWidth('MENU') / 2, textNormal / 2, () => {
    tick.play();
    page = 'MainMenu';
  });
}

let cardUp = -1;
let isTheSame;
let checkCard = new Array();
let rowCard = new Array(2);
let columnCard = new Array(2);
let win = 0;
let newRecord;

function clickToFlipTheCard(rowIndex, columnIndex, xPos, yPos, halfCardWidth, halfCardHeight) {
  objectOver(xPos, yPos, halfCardWidth, halfCardHeight, () => {
    if (!rotateStatus[rowIndex][columnIndex] && isAbleToRotate[rowIndex][columnIndex] && cardUp != 1) {
      changeFlipDirection(rowIndex, columnIndex);
      rotateStatus[rowIndex][columnIndex] = true;
    }

    if (!isFaceUp[rowIndex][columnIndex] && isAbleToRotate[rowIndex][columnIndex] && cardUp != 1) {
      isAbleToRotate[rowIndex][columnIndex] = false;

      flip.play();
      isFaceUp[rowIndex][columnIndex] = true;
      cardUp++;

      checkCard[cardUp] = cardIdentity[rowIndex][columnIndex];

      rowCard[cardUp] = rowIndex;
      columnCard[cardUp] = columnIndex;

      if (cardUp == 1) {
        if (checkCard[0] == checkCard[1]) {
          for (let i = 0; i < 2; i++) {
            isAbleToRotate[rowCard[i]][columnCard[i]] = false;
          }
          cardUp = -1;
          win++;
          isTheSame = true;
        } else {
          startTimeToFlipBack = millis();
          isTheSame = false;
        }
      }
    }

    if (win == totalCardSymbol) {
      startTimeToFlipBack = millis();
      loadBestTime();

      if (modeBT == 'NONE' || parseInt(timeAsText.split(':')[0]) < parseInt(modeBT.split(':')[0]) || parseInt(timeAsText.split(':')[1]) < parseInt(modeBT.split(':')[1])) {
        saveToLocalStorage();

        newRecord = true;
      } else {
        newRecord = false;
      }
    }
  });
}
