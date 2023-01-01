let asset;
let cardIdentity;
let cardSymbol = ['circle', 'triangle', 'rectangle', 'diamond', 'star', 'cross'];

function loadAssets() {
  asset = new Array();

  for (let i = 0; i < totalCardSymbol; i++) {
    asset.push(loadImage('../../src/game_file/assets/card/' + theme + '/' + cardSymbol[i] + '.png'));
  }

  cardIdentity = new Array();

  for (let i = 0; i < 2; i++) {
    cardIdentity.push(new Array());
    for (let j = 0; j < totalCardSymbol; j++) {
      cardIdentity[i][j] = asset[j];
    }
  }
}

function shuffleCard() {
  let Rows = cardIdentity.length;
  let Cols = cardIdentity[0].length;
  let randC, randR, imgTemp;
  for (let row = 0; row < Rows; row++) {
    for (let col = 0; col < Cols; col++) {
      randR = Math.floor(Math.random() * Rows);
      randC = Math.floor(Math.random() * Cols);
      imgTemp = cardIdentity[row][col];
      cardIdentity[row][col] = cardIdentity[randR][randC];
      cardIdentity[randR][randC] = imgTemp;
    }
  }
}
