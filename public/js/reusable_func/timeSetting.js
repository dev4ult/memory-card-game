let startTime, endTime, interval, runningSecond, runningMinute;
let timeAsText;

function displayTimer() {
  interval = 1000;

  if (getTickingMillis() >= interval) {
    runningSecond++;
    startTime = millis();
  }

  if (runningSecond > 59) {
    runningMinute++;
    runningSecond = 0;
  }
  timeAsText = runningMinute + ':' + runningSecond;

  textSize(textNormal);
  fill(textColor);
  text(timeAsText, halfSketchWidth - 50, 30 - halfSketchHeight);
}

function getTickingMillis() {
  return endTime - startTime;
}

let gameStart = true;

function waitToStartGame() {
  interval = 3;
  if (runningSecond >= interval && gameStart) {
    setupCard();
    gameStart = false;
    console.log('Game Started');
  }
}

let startTimeToFlipBack;

function timeWaitToFlipBackTicking() {
  return endTime - startTimeToFlipBack;
}

function waitToFlipBack() {
  interval = 700;
  if (timeWaitToFlipBackTicking() >= interval && cardUp == 1 && !isTheSame) {
    for (let i = 0; i < 2; i++) {
      changeFlipDirection(rowCard[i], columnCard[i]);

      rotateStatus[rowCard[i]][columnCard[i]] = true;
      isFaceUp[rowCard[i]][columnCard[i]] = false;
    }

    isTheSame = true;
  }
}

function waitAfterWin() {
  interval = 500;
  if (win == totalCardSymbol && timeWaitToFlipBackTicking() >= interval) {
    resetCard();
    page = 'WinGame';
    win = 0;
    winSound.play();
  }
}
