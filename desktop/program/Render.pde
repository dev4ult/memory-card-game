String page = "MainMenu";

PFont pixelFont;
JSONObject json;

int xCenter;
int startTime, endTime;


void setup() {
  reloadBestTime();
  pixelFont = createFont("../font/PressStart2P-Regular.ttf", 50);
  textFont(pixelFont);
  size(1000, 800, P3D);
  xCenter = width / 2;
  smooth();
  imageMode(CENTER);

  
}

void clickToRenderPage(String thePage, boolean changeTheme, float xPos, float yPos,
  float objHalfWidth, float objHalfHeight) {
  if ((mouseX <= xPos + objHalfWidth && mouseX >= xPos -  objHalfWidth) &&
    (mouseY <= yPos + objHalfHeight && mouseY >= yPos - objHalfHeight)) {
    page = thePage;
    if (changeTheme) {
      renderTheme();
    }
  }
}

void mouseClicked() {
  switch(page) {
  case "MainMenu":
    mainMenuMouseClicked();
    break;
  case "SettingsPage":
    settingsPageMouseClicked();
    break;
  case "PlayGame":
    defaultCamera();
    playGameMouseClicked();
    break;
  case "WinPage":
    winGameMouseClicked();
    break;
  case "RecordPage":
    recordPageMouseClicked();
    break;
  case "GameMode":
    gameModeMouseClicked();
    break;
  default:
    println("page does not exits");
  }
}

void setCamera() {
  camera(mouseX, mouseY,
    (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
}

void defaultCamera() {
  camera();
}

void draw() {
  endTime = millis();
  switch(page) {
  case "MainMenu":
    setCamera();
    mainMenu();
    break;
  case "SettingsPage":
    setCamera();
    settingsPage();
    break;
  case "PlayGame":
    defaultCamera();
    playGame();
    break;
  case "GameMode":
    setCamera();
    gameMode();
    break;
  case "WinPage":
    setCamera();
    winGame();
    break;
  case "RecordPage":
    setCamera();
    recordPage();
    break;
  default:
    println("page does not exits");
  }
}
