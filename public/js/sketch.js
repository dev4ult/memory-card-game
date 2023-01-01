const sketchContainer = document.querySelector('#sketch-container');
let width, height;
let halfSketchWidth, halfSketchHeight;
let textXL, textLarge, textMedium, textNormal, textSmall;

function setSize() {
  width = sketchContainer.offsetWidth;
  height = sketchContainer.offsetHeight;
  halfSketchWidth = width / 2;
  halfSketchHeight = height / 2;
  textMedium = width * 0.03;
  textXL = width * 0.05;
  textLarge = width * 0.04;
  textNormal = width * 0.02;
  textSmall = width * 0.01;
}

let pixelFont;

function preload() {
  pixelFont = loadFont('../../src/game_file/font/PressStart2P-Regular.ttf');
  soundFormats('mp3', 'ogg');
  loadSoundLocal();
}

function setup() {
  setSize();
  darkTheme();
  const canvas = createCanvas(width, height, WEBGL);
  canvas.parent(sketchContainer);
  themeSound.loop();
}

let page = 'MainMenu';

function mouseClicked() {
  switch (page) {
    case 'MainMenu':
      mainMenuMouseClicked();
      break;
    case 'GameMode':
      gameModeMouseClicked();
      break;
    case 'Settings':
      settingsMouseClicked();
      break;
    case 'PlayGame':
      playGameMouseClicked();
      break;
    case 'WinGame':
      winGameMouseClicked();
      break;
    case 'GameRecord':
      gameRecordMouseClicked();
      break;
    default:
      console.log('Unknown Game Page');
  }
}

function setCameraToMoveByMouse() {
  camera(mouseX - halfSketchWidth, mouseY - halfSketchHeight, height / 2 / tan(PI / 6), 0, 0, 0, 0, 1, 0);
}

function setCameraToStatic() {
  camera();
}

function draw() {
  endTime = millis();
  textFont(pixelFont);
  setCameraToMoveByMouse();
  textAlign(CENTER, CENTER);

  switch (page) {
    case 'MainMenu':
      Main_Menu();
      break;
    case 'GameMode':
      Game_Mode();
      break;
    case 'Settings':
      Settings();
      break;
    case 'PlayGame':
      setCameraToStatic();
      Play_Game();
      break;
    case 'WinGame':
      setCameraToMoveByMouse();
      Win_Game();
      break;
    case 'GameRecord':
      Game_Record();
      break;
    default:
      console.log('Uknown Game Page');
  }
}

function windowResized() {
  setSize();
  canvas = resizeCanvas(width, height, WEBGL);
}
