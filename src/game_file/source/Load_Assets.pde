PImage[] asset;
String[] cardName = {"circle", "triangle", "rectangle", "diamond", "star", "cross"};
PImage[][] cardIdentity;

void loadAssets() {
  
  asset  = new PImage[totalCardType];
  
  for (int i = 0; i < totalCardType; i++) {
    asset[i] = loadImage("../assets/card/" + theme + "/" + cardName[i] + ".png");
  }
  
  cardIdentity = new PImage[2][totalCardType];
  
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < totalCardType; j++) {
      cardIdentity[i][j] = asset[j];
    }
  }
}
