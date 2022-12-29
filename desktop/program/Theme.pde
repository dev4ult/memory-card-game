String theme = "DARK";

int bgColor = #0d0401;
int textColor = #f2f2f2;
int primaryHoverColor = #87f49a;
int secondaryHoverColor = #fcba03;

void darkTheme() {
  theme = "DARK";
  bgColor = 30;
  textColor = #f2f2f2;
  primaryHoverColor = #87f49a;
  secondaryHoverColor = #fcba03;
}

void lightTheme() {
  theme = "LIGHT";
  bgColor = #d9d9d9;
  textColor = #0d0401;
  primaryHoverColor = #40c27a;
  secondaryHoverColor = #fcba03;
}

void colorfullTheme() {
  theme = "COLORFULL";
  bgColor = #4195f0;
  textColor = #542a91;
  primaryHoverColor = #b2f007;
  secondaryHoverColor = #e637c0;
}

void renderTheme() {
  switch(theme) {
  case "DARK":
    lightTheme();
    break;
  case "LIGHT":
    colorfullTheme();
    break;
  case "COLORFULL":
    darkTheme();
    break;
  default:
    println("unknown color theme");
  }
}
