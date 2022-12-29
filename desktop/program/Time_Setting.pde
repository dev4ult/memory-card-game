String easyBT, normalBT, hardBT;

void reloadBestTime() {
  json = loadJSONObject("../data/record.json");
  easyBT = json.getString("easy");
  normalBT = json.getString("normal");
  hardBT = json.getString("hard");
}

int minuteTime = 0;
int secondTime = 0;

void setGameStart(float yPos, String gameMode) {
  textSize(35);
  float halfExitText = textWidth("Play") / 2;
  if ((mouseX <= xCenter + halfExitText && mouseX >= xCenter -  halfExitText) &&
    (mouseY <= yPos + 15 && mouseY >= yPos - 15)) {
    startTime = millis();
    minuteTime = 0;
    secondTime = 0;
    shuffleColor(colorCard);
    gameModeName = gameMode;
    viewAllColorCard();
    gameStart = true;
  }
}

String timeText;

int timeTicking() {
  return endTime - startTime;
}

void getTime() {
  int interval = 1000;

  if (timeTicking() >= interval) {
    secondTime++;
    startTime = millis();
  }

  if (secondTime >= 59) {
    minuteTime++;
    secondTime = 0;
  }

  timeText = minuteTime + ":" + secondTime;
  displayText("Time - "+timeText, 25, 0, textColor, textColor, xCenter, 760);
}

boolean gameStart;

void waitToStartTheGame() {
  int interval = 3;
  if(secondTime >= interval && gameStart) {
    setCard();
    gameStart = false;
  }
  
}

void waitToRotate() {
  int interval = 700;
  if (timeWaitToRotateTicking() >= interval && cardUp == 1 && !sameCard) {
    for (int i = 0; i < 2; i++) {
      rotateStatus[rowCard[i]][columnCard[i]] = true;
      cardFaceUp[rowCard[i]][columnCard[i]] = false;
      isAbleToRotate[rowCard[i]][columnCard[i]] = true;
    }
    cardUp = -1;
    sameCard = true;
  }
}

int startTimeToRotate;

int timeWaitToRotateTicking() {
  return endTime - startTimeToRotate;
}

void waitAfterWin() {
  int interval = 500;
  if (win == 4 && timeWaitToRotateTicking() >= interval) {
    resetCard();

    page = "WinPage";
    win = 0;
  }
}
