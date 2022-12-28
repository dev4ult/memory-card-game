void displayRect(float xPos, float yPos,
                 float widthSize, float heightSize, 
                 int colorFill, int colorStroke) {
  //noFill();
  noStroke(); 

  if (colorFill != -1) {
    fill(colorFill);
  } 
  
  if(colorStroke != -1) {
    stroke(colorStroke);
  }
  
  rect(xPos, yPos, widthSize, heightSize);
}
