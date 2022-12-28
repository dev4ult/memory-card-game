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

  const canvas = createCanvas(width, height, WEBGL);
  canvas.parent(sketchContainer);
}

function draw() {
  camera(mouseX - halfSketchWidth, mouseY - halfSketchHeight, height / 2 / tan(PI / 6), 0, 0, 0, 0, 1, 0);
  textFont(pixelFont);

  mainMenu();
}

function windowResized() {
  getSize();
  canvas = resizeCanvas(width, height, WEBGL);
}
