const sketchContainer = document.querySelector('#sketch-container');
let width, height;
let halfSketchWidth, halfSketchHeight;

function getSize() {
  width = sketchContainer.offsetWidth;
  height = sketchContainer.offsetHeight;
  halfSketchWidth = width / 2;
  halfSketchHeight = height / 2;
}

let pixelFont;

function preload() {
  pixelFont = loadFont('../font/PressStart2P-Regular.ttf');
}

function setup() {
  getSize();
  darkTheme();

  const canvas = createCanvas(width, height, WEBGL);
  canvas.parent(sketchContainer);
}

let page = 'MainMenu';

function mouseClicked() {
  switch (page) {
    case 'MainMenu':
      mainMenuMouseClicked();
      break;
    case 'Settings':
      settingsMouseClicked();
      break;
    case 'PlayGame':
      playGameMouseClicked();
      break;
  }
}

function setCameraToMoveByMouse() {
  camera(mouseX - halfSketchWidth, mouseY - halfSketchHeight, height / 2 / tan(PI / 6), 0, 0, 0, 0, 1, 0);
}

function setCameraToStatic() {
  camera();
}

function draw() {
  textFont(pixelFont);
  setCameraToMoveByMouse();

  switch (page) {
    case 'MainMenu':
      mainMenu();
      break;
    case 'Settings':
      settings();
      break;
    case 'PlayGame':
      setCameraToStatic();
      playGame();
      break;
  }
}

function windowResized() {
  getSize();
  canvas = resizeCanvas(width, height, WEBGL);
}
