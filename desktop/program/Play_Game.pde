boolean rotateHorizontal = true;

boolean[][] rotateStatus = {
    {false, false, false, false}, 
    {false, false, false, false}
};

float[][] rectAngle = {
    {0, 0, 0, 0},
    {0, 0, 0, 0}
};

void playGame() {
  background(bgColor);
  displayText("Choose and Match the card", 25, 0, textColor, textColor, xCenter, 75);
  displayText("menu", 25, 5, textColor, secondaryHoverColor, 75, 765);
  
  rectMode(CENTER);
  setRect();
  displayTime();
  
  for(int i = 0; i < 2; i++) {
    for(int j = 0; j < 4; j++) {
      rotateRect(i, j); 
    }
  }
}

void setRect() {
  int k = 0, l = 0;
  for(int i = 300; i <= 590; i = i + 290) {
    l = 0;
    for(int j = 140; j <= 860; j = j + 240) {
      pushMatrix();
      translate(j, i);
      
      if (rotateHorizontal) {
         rotateY(radians(rectAngle[k][l]));
      } else {
         rotateX(radians(rectAngle[k][l])); 
      }
      
      displayRect(0, 0, 200, 250, textColor, #ffffff);
      popMatrix();
      l++;
    }
    k++;
  }
}

void rotateRect(int rowIndex, int columnIndex) {
  if(rotateStatus[rowIndex][columnIndex]) {
    rectAngle[rowIndex][columnIndex] += 10;
    if (rectAngle[rowIndex][columnIndex] == 180) {
      rotateStatus[rowIndex][columnIndex] = false;
      rectAngle[rowIndex][columnIndex] = 0;
    }
  }
}

void displayTime() {
  int s = second();
  displayText("Time:" + s, 25, 0, textColor, textColor, 500, 765);
}

void playGameMouseClicked() {
 if (page == "PlayGame") {
    clickToRenderPage("MainMenu", false, 75, 
                       780, textWidth("menu") / 2, 15);
                       
    int k = 0, l = 0;
    for(int i = 300; i <= 590; i = i + 290) {
      l = 0;
      for(int j = 140; j <= 860; j = j + 240) {
        clickToRotateRect(k, l, j, i, 100, 150);
        l++;
      }
      k++;
    }
    
    if (rotateHorizontal) {
       rotateHorizontal = false;
    } else {
       rotateHorizontal = true;  
    }
  } 
}

void clickToRotateRect(int rowIndex, int columnIndex, float xPos, float yPos, 
                   float objHalfWidth, float objHalfHeight) {
   if((mouseX <= xPos + objHalfWidth && mouseX >= xPos -  objHalfWidth) && 
     (mouseY <= yPos + objHalfHeight && mouseY >= yPos - objHalfHeight)) {
       
      if (rotateStatus[rowIndex][columnIndex]) {
        rotateStatus[rowIndex][columnIndex] = false;
      } else {
        rotateStatus[rowIndex][columnIndex] = true;
      }
  } 
}
