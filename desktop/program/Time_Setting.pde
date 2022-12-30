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
    (mouseY <= yPos + 20 && mouseY >= yPos - 20)) {
    startTime = millis();
    minuteTime = 0;
    secondTime = 0;
    gameModeName = gameMode;
    gameType();
    loadAssets();
    
    shuffleCard(cardIdentity);
    setAllCardStatus();
    gameStart = true;
    rotateInterval = 10;
  }
}

void gameType() {
  switch(gameModeName) {
  case "EASY":
    setGameMode(4, 140, 300, 240, 290, 860, 590, 100, 125);
    break;
  case "NORMAL":
    setGameMode(5, 108, 300, 196, 246, 892, 546, 88, 113);
    break;
  case "HARD":
    setGameMode(6, 87.5, 300, 165, 215, 912.5, 515, 77.5, 102.5);
    break;
  default:
    println("Unknown Game Mode");
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
  displayText(timeText, 25, 0, textColor, textColor, 915, 75);
}

boolean gameStart;

void waitToStartTheGame() {
  int interval = 3;
  if (secondTime >= interval && gameStart) {
    setCard();
    gameStart = false;
  }
}

void waitToRotate() {
  int interval = 700;
  if (timeWaitToRotateTicking() >= interval && cardUp == 1 && !sameCard) {
    for (int i = 0; i < 2; i++) {
      changeRotateDirection(rowCard[i], columnCard[i]);

      rotateStatus[rowCard[i]][columnCard[i]] = true;
      cardFaceUp[rowCard[i]][columnCard[i]] = false;
    }

    sameCard = true;
  }
}

int startTimeToRotate;

int timeWaitToRotateTicking() {
  return endTime - startTimeToRotate;
}

void waitAfterWin() {
  int interval = 500;
  if (win == totalCardType && timeWaitToRotateTicking() >= interval) {
    resetCard();

    page = "WinPage";
    win = 0;
  }
}
