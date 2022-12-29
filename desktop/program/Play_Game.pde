boolean rotateHorizontal = true;

boolean[][] rotateStatus = {
            {false, false, false, false}, 
            {false, false, false, false}
};

float[][] rectAngle = {
          {0, 0, 0, 0},
          {0, 0, 0, 0}
};

int[][] colorCard = {
        {#FFDB89, #FFDB89, #82AAE3, #E98EAD}, 
        {#86C8BC, #82AAE3, #86C8BC, #E98EAD}
};

int cardUp = -1;
int[] checkCard = new int[2];
int[] rowCard = new int[2];
int[] columnCard = new int[2];

boolean[][] isAbleToRotate = {
            {true, true, true, true},
            {true, true, true, true}
};

int[][] bgCard = {
          {#f2f2f2, #f2f2f2, #f2f2f2, #f2f2f2},
          {#f2f2f2, #f2f2f2, #f2f2f2, #f2f2f2}
};

boolean[][] cardFaceUp = {
        {false, false, false, false},
        {false, false, false, false}
};


void playGame() {
  background(bgColor);
  displayText("Choose and Match the card", 25, 0, textColor, textColor, xCenter, 75);
  displayText("menu", 25, 5, textColor, secondaryHoverColor, 75, 765);
    
  rectMode(CENTER);
  displayTime();
  setRect();
}

void shuffleColor(int[][] array){
    int Cols = array.length;
    int Rows = array[0].length;
    for(int col = 0; col < Cols; col++){
      for(int row = 0; row < Rows; row++){
        int randC = int(random(Cols));
        int randR = int(random(Rows));
        int temp = array[col][row];
        array[col][row] = array[randC][randR];
        array[randC][randR] = temp;
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

      displayRect(0, 0, 200, 250, bgCard[k][l], #ffffff);

      popMatrix();
      rotateRect(k, l);
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
  

  if(!cardFaceUp[rowIndex][columnIndex] && isAbleToRotate[rowIndex][columnIndex]){
      bgCard[rowIndex][columnIndex] = #f2f2f2; 
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
        clickToRotateRect(k, l, j, i, 100, 125);
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

int win = 0;
void clickToRotateRect(int rowIndex, int columnIndex, float xPos, float yPos, 
                       float objHalfWidth, float objHalfHeight) {
          
   if((mouseX <= xPos + objHalfWidth && mouseX >= xPos -  objHalfWidth) && 


      (mouseY <= yPos + objHalfHeight && mouseY >= yPos - objHalfHeight)) {
     
     if (!rotateStatus[rowIndex][columnIndex] && isAbleToRotate[rowIndex][columnIndex]) {
          rotateStatus[rowIndex][columnIndex] = true;
          isAbleToRotate[rowIndex][columnIndex] = false;
     }
      
      if (!cardFaceUp[rowIndex][columnIndex]){
        
        cardFaceUp[rowIndex][columnIndex] = true;
        cardUp++;    
        
        bgCard[rowIndex][columnIndex] = colorCard[rowIndex][columnIndex];
        checkCard[cardUp] = bgCard[rowIndex][columnIndex];
        rowCard[cardUp] = rowIndex;
        columnCard[cardUp] = columnIndex;
        
        if (cardUp == 1)
        {       
           if (hex(checkCard[0]).equals(hex(checkCard[1]))){
           
             for(int i = 0; i < 2; i++){
                isAbleToRotate[rowCard[i]][columnCard[i]] = false;
             }
             cardUp = -1;
             win++;
           } else {  
             
             for(int i = 0; i < 2; i++)
               {
                rotateStatus[rowCard[i]][columnCard[i]] = true;
                cardFaceUp[rowCard[i]][columnCard[i]] = false;
                isAbleToRotate[rowCard[i]][columnCard[i]] = true;
               }
               
               cardUp = -1;          
                          
                 } 
         }                    
           } else {     
        cardFaceUp[rowIndex][columnIndex] = false;
           }
       if (win == 4 ){
         
           for ( int i = 0; i < 2; i++){
                 for (int j = 0; j <4; j++){
                   
                rotateStatus[i][j] = false;
                  cardFaceUp[i][j] = false;
              isAbleToRotate[i][j] = true;              
                  
                 }
             }
             
          page = "WinPage";
          win =0;
       
       }
        
   } 
}