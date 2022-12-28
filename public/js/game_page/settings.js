let theme = 'dark';
let bgColor, textColor, primaryHoverColor, secondaryHoverColor;

function settings() {
  background(bgColor);
  cursor(ARROW);

  textSize(50);
  fill(textColor);
  text('Settings', 0, -150);

  textButton('Theme:' + theme, 35, 5, textColor, primaryHoverColor, 0, -80);
  textButton('back', 35, 5, textColor, secondaryHoverColor, 0, -30);
}

function settingsMouseClicked() {
  textSize(40);

  objectOver(0, -80, textWidth('Theme:' + theme), 20, () => {
    renderTheme();
  });

  objectOver(0, -30, textWidth('back') / 2, 20, () => {
    page = 'MainMenu';
  });
}

function renderTheme() {
  switch (theme) {
    case 'dark':
      lightTheme();
      break;
    case 'light':
      colorfullTheme();
      break;
    case 'colorfull':
      darkTheme();
      break;
    default:
      console.log('unknown color theme');
      break;
  }
}

function darkTheme() {
  theme = 'dark';
  bgColor = 30;
  textColor = '#f2f2f2';
  primaryHoverColor = '#87f49a';
  secondaryHoverColor = '#fcba03';
}

function lightTheme() {
  theme = 'light';
  bgColor = '#d9d9d9';
  textColor = '#0d0401';
  primaryHoverColor = '#16cc5c';
  secondaryHoverColor = '#fcba03';
}

function colorfullTheme() {
  theme = 'colorfull';
  bgColor = '#4195f0';
  textColor = '#542a91';
  primaryHoverColor = '#b2f007';
  secondaryHoverColor = '#e637c0';
}
