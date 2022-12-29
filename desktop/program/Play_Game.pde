boolean rotateHorizontal = true;

boolean[][] rotateStatus = {
  {false, false, false, false},
  {false, false, false, false}
};

float[][] rectAngle = {
  {0, 0, 0, 0},
  {0, 0, 0, 0}
};

int[][] colorCard = {
  {#FFDB89, #FFDB89, #82AAE3, #E98EAD},
  {#86C8BC, #82AAE3, #86C8BC, #E98EAD}
};

int cardUp = -1;
int[] checkCard = new int[2];
int[] rowCard = new int[2];
int[] columnCard = new int[2];

boolean[][] isAbleToRotate = {
  {true, true, true, true},
  {true, true, true, true}
};

int[][] bgCard = {
  {#f2f2f2, #f2f2f2, #f2f2f2, #f2f2f2},
  {#f2f2f2, #f2f2f2, #f2f2f2, #f2f2f2}
};

boolean[][] cardFaceUp = {
  {false, false, false, false},
  {false, false, false, false}
};

void playGame() {
  background(bgColor);

  waitToStartTheGame();

  displayText("Choose and Match the card", 25, 0, textColor, textColor, xCenter, 75);
  displayText("menu", 25, 5, textColor, secondaryHoverColor, 75, 765);

  rectMode(CENTER);
  setRect();

  waitToRotate();
  waitAfterWin();
  getTime();
}

void shuffleColor(int[][] array) {
  int Cols = array.length;
  int Rows = array[0].length;
  for (int col = 0; col < Cols; col++) {
    for (int row = 0; row < Rows; row++) {
      int randC = int(random(Cols));
      int randR = int(random(Rows));
      int temp = array[col][row];
      array[col][row] = array[randC][randR];
      array[randC][randR] = temp;
    }
  }
}

void setRect() {

  int k = 0, l = 0;
  for (int i = 300; i <= 590; i = i + 290) {
    l = 0;
    for (int j = 140; j <= 860; j = j + 240) {
      pushMatrix();
      translate(j, i);

      if (rotateHorizontal) {
        rotateY(radians(rectAngle[k][l]));
        rotateHorizontal = false;
      } else {
        rotateX(radians(rectAngle[k][l]));
        rotateHorizontal = true;
      }

      displayRect(0, 0, 200, 250, bgCard[k][l], #ffffff);

      popMatrix();
      rotateRect(k, l);
      l++;
    }
    k++;
  }
}

void rotateRect(int rowIndex, int columnIndex) {
  if (rotateStatus[rowIndex][columnIndex]) {
    rectAngle[rowIndex][columnIndex] += 10;
    if (rectAngle[rowIndex][columnIndex] == 180) {
      rotateStatus[rowIndex][columnIndex] = false;
      rectAngle[rowIndex][columnIndex] = 0;
    }
  }

  if (!cardFaceUp[rowIndex][columnIndex] && isAbleToRotate[rowIndex][columnIndex]) {
    bgCard[rowIndex][columnIndex] = #f2f2f2;
  }
}

void playGameMouseClicked() {
  clickToRenderPage("MainMenu", false, 75,
    780, textWidth("menu") / 2, 15);

  int k = 0, l = 0;
  for (int i = 300; i <= 590; i = i + 290) {
    l = 0;
    for (int j = 140; j <= 860; j = j + 240) {
      clickToRotateRect(k, l, j, i, 100, 125);
      l++;
    }
    k++;
  }
}

void resetCard() {
  for ( int i = 0; i < 2; i++) {
    for (int j = 0; j < 4; j++) {
      rotateStatus[i][j] = false;
      cardFaceUp[i][j] = false;
      isAbleToRotate[i][j] = true;
    }
  }
}

void viewAllColorCard() {
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 4; j++) {
      rotateStatus[i][j] = true;
      bgCard[i][j] = colorCard[i][j];
      isAbleToRotate[i][j] = false;
      cardFaceUp[i][j] = true;
    }
  }
}

void setCard() {
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 4; j++) {
      bgCard[i][j] = #f2f2f2;
      rotateStatus[i][j] = true;
      isAbleToRotate[i][j] = true;
      cardFaceUp[i][j] = false;
    }
  }
}


int win = 0;
boolean sameCard;

void clickToRotateRect(int rowIndex, int columnIndex, float xPos, float yPos,
  float objHalfWidth, float objHalfHeight) {

  if ((mouseX <= xPos + objHalfWidth && mouseX >= xPos -  objHalfWidth) &&
    (mouseY <= yPos + objHalfHeight && mouseY >= yPos - objHalfHeight)) {

    if (!rotateStatus[rowIndex][columnIndex] && isAbleToRotate[rowIndex][columnIndex] && cardUp != 1) {
      rotateStatus[rowIndex][columnIndex] = true;
      isAbleToRotate[rowIndex][columnIndex] = false;
    }

    if (!cardFaceUp[rowIndex][columnIndex] && cardUp != 1) {
      cardFaceUp[rowIndex][columnIndex] = true;
      cardUp++;

      bgCard[rowIndex][columnIndex] = colorCard[rowIndex][columnIndex];
      checkCard[cardUp] = bgCard[rowIndex][columnIndex];

      rowCard[cardUp] = rowIndex;
      columnCard[cardUp] = columnIndex;

      if (cardUp == 1) {
        if (hex(checkCard[0]).equals(hex(checkCard[1]))) {
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

    if (win == 4) {
      startTimeToRotate = millis();
      setBestTime();
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

String modeBT;

void setBestTime() {
  switch(gameModeName) {
  case "EASY":
    modeBT = easyBT;
    break;
  case "NORMAL":
    modeBT = normalBT;
    break;
  case "HARD":
    modeBT = hardBT;
    break;
  default:
    println("Unknown Game Mode");
  }
}

void setSaveJSONBT() {
  json = new JSONObject();

  switch(gameModeName) {
  case "EASY":
    json.setString("easy", timeText);
    json.setString("normal", normalBT);
    json.setString("hard", hardBT);
    break;
  case "NORMAL":
    json.setString("easy", easyBT);
    json.setString("normal", timeText);
    json.setString("hard", hardBT);
    break;
  case "HARD":
    json.setString("easy", easyBT);
    json.setString("normal", normalBT);
    json.setString("hard", timeText);
    break;
  default:
    println("Unknown Game Mode");
  }

  saveJSONObject(json, "../data/record.json");
}
