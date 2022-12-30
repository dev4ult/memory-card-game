boolean rotateHorizontal = true;

boolean[][] rotateStatus;
float[][] rectAngle;

int cardUp = -1;
PImage[] checkCard = new PImage[2];
int[] rowCard = new int[2];
int[] columnCard = new int[2];

boolean[][] isAbleToRotate;
boolean[][] cardFaceUp;

int[][] zPos;


void playGame() {
  background(bgColor);

  waitToStartTheGame();

  displayText("Match the card", 25, 0, textColor, textColor, xCenter, 75);
  cursor(ARROW);

  displayText("MENU", 25, 5, textColor, secondaryHoverColor, 75, 75);

  rectMode(CENTER);
  setRect();

  waitToRotate();
  waitAfterWin();
  getTime();
}

void shuffleCard(PImage[][] array) {
  int Cols = array.length;
  int Rows = array[0].length;
  for (int col = 0; col < Cols; col++) {
    for (int row = 0; row < Rows; row++) {
      int randC = int(random(Cols));
      int randR = int(random(Rows));
      PImage imgTemp = array[col][row];
      array[col][row] = array[randC][randR];
      array[randC][randR] = imgTemp;
    }
  }
}

void setRect() {

  int k = 0, l = 0;
  for (float i = yPosStart; i <= yLimit; i = i + yRange) {
    l = 0;
    for (float j = xPosStart; j <= xLimit; j = j + xRange) {
      pushMatrix();

      translate(j, i, zPos[k][l]);

      if (rotateHorizontal) {
        rotateY(radians(rectAngle[k][l]));
      } else {
        rotateX(radians(rectAngle[k][l]));
      }
      rotateHorizontal = !rotateHorizontal;

      image(cardIdentity[k][l], 0, 0, 80, 80);

      translate(0, 0, -zPos[k][l]);
      displayRect(0, 0, halfWidthRect * 2, halfHeightRect * 2, textColor, #ffffff);

      popMatrix();

      rotateRect(k, l);
      l++;
    }
    k++;
  }
}

int rotateInterval = 10;

void rotateRect(int rowIndex, int columnIndex) {
  if (rotateStatus[rowIndex][columnIndex]) {
    rectAngle[rowIndex][columnIndex] += rotateInterval;
    if (rectAngle[rowIndex][columnIndex] == 180 || rectAngle[rowIndex][columnIndex] == 0) {
      rotateStatus[rowIndex][columnIndex] = false;
    }
    if (rectAngle[rowIndex][columnIndex] == 180 && !isAbleToRotate[rowIndex][columnIndex]) {
      isAbleToRotate[rowIndex][columnIndex] = true;
      cardUp = -1;
    }
  }
}

void playGameMouseClicked() {
  clickToRenderPage("MainMenu", false, 75,
    75, textWidth("menu") / 2, 15);

  int k = 0, l = 0;
  for (float i = yPosStart; i <= yLimit; i = i + yRange) {
    l = 0;
    for (float j = xPosStart; j <= xLimit; j = j + xRange) {
      clickToRotateRect(k, l, j, i, halfWidthRect, halfHeightRect);
      l++;
    }
    k++;
  }
}

void resetCard() {
  for ( int i = 0; i < 2; i++) {
    for (int j = 0; j < totalCardType; j++) {
      rotateStatus[i][j] = false;
      cardFaceUp[i][j] = false;
      isAbleToRotate[i][j] = true;
    }
  }
}

void setAllCardStatus() {
  rotateStatus = new boolean[2][totalCardType];
  rectAngle = new float[2][totalCardType];
  isAbleToRotate = new boolean[2][totalCardType];
  cardFaceUp = new boolean[2][totalCardType];
  zPos = new int[2][totalCardType];

  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < totalCardType; j++) {
      rotateStatus[i][j] = false;
      rectAngle[i][j] = 0;
      zPos[i][j] = 1;
      isAbleToRotate[i][j] = false;
      cardFaceUp[i][j] = true;
    }
  }
}

void setCard() {
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < totalCardType; j++) {
      //bgCard[i][j] = #f2f2f2;
      rotateStatus[i][j] = true;
      isAbleToRotate[i][j] = true;
      cardFaceUp[i][j] = false;
    }
  }
}

int win = 0;
boolean sameCard;

void changeRotateDirection(int rowIndex, int columnIndex) {
  if (rectAngle[rowIndex][columnIndex] == 0) {
    rotateInterval = 10;
  } else {
    rotateInterval = -10;
  }
}

void clickToRotateRect(int rowIndex, int columnIndex, float xPos, float yPos,
  float objHalfWidth, float objHalfHeight) {

  if ((mouseX <= xPos + objHalfWidth && mouseX >= xPos -  objHalfWidth) &&
    (mouseY <= yPos + objHalfHeight && mouseY >= yPos - objHalfHeight)) {

    if (!rotateStatus[rowIndex][columnIndex] && isAbleToRotate[rowIndex][columnIndex] && cardUp != 1) {
      changeRotateDirection(rowIndex, columnIndex);
      rotateStatus[rowIndex][columnIndex] = true;
      playFlipSound();
    }

    if (!cardFaceUp[rowIndex][columnIndex] && isAbleToRotate[rowIndex][columnIndex] && cardUp != 1) {
      isAbleToRotate[rowIndex][columnIndex] = false;

      cardFaceUp[rowIndex][columnIndex] = true;
      cardUp++;

      checkCard[cardUp] = cardIdentity[rowIndex][columnIndex];

      rowCard[cardUp] = rowIndex;
      columnCard[cardUp] = columnIndex;

      if (cardUp == 1) {
        if (checkCard[0] == checkCard[1]) {
          for (int i = 0; i < 2; i++) {
            isAbleToRotate[rowCard[i]][columnCard[i]] = false;
          }
          cardUp = -1;
          win++;
          sameCard = true;
        } else {
          startTimeToRotate = millis();
          sameCard = false;
        }
      }
    }

    if (win == totalCardType) {
      startTimeToRotate = millis();
      setBestTime();
      playWinSound();
      if (modeBT.equals("NONE") ||
        int(split(timeText, ':')[0]) < int(split(modeBT, ':')[0]) ||
        int(split(timeText, ':')[1]) < int(split(modeBT, ':')[1])) {

        setSaveJSONBT();

        newRecord = true;
      } else {

        newRecord = false;
      }
    }
  }
}
