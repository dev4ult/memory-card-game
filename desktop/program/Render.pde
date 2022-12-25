String page = "MainMenu";
PFont pixelFont;
int xCenter;

void setup() {
  size(1000, 800, P3D);
  xCenter = width / 2;
  pixelFont = createFont("../font/PressStart2P-Regular.ttf", 50);
  textAlign(CENTER);
  textFont(pixelFont);
  smooth();
}

void clickToRenderPage(String thePage, float xPos, float yPos, 
                   float objWidth, float objHeight) {
  if((mouseX <= xPos + objWidth && mouseX >= xPos -  objWidth) && 
     (mouseY <= yPos + objHeight && mouseY >= yPos - objHeight)) {
      page = thePage;
  }                
}

void mouseClicked() {
  if (page == "MainMenu") {
    clickToRenderPage("SettingsPage", xCenter, 
                       350, textWidth("Settings") / 2, 20);    
  } else if (page == "SettingsPage") {
    clickToRenderPage("MainMenu", xCenter, 
                       285, textWidth("go back") / 2, 15);
  }
}

void setCamera() {
    camera(mouseX, mouseY, 
    (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
}

void draw() {
  setCamera();
  if(page == "MainMenu") {
    mainMenu(); 
  } else if(page == "SettingsPage") {
    settingsPage(); 
  }
}
