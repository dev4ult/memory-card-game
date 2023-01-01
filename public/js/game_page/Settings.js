let theme = 'DARK';
let bgColor, textColor, primaryHoverColor, secondaryHoverColor;
let music = 'ON';
function Settings() {
  background(bgColor);
  cursor(ARROW);

  textSize(textXL);
  fill(textColor);
  text('Settings', 0, -150);

  textButton('THEME:' + theme, textMedium, 5, textColor, primaryHoverColor, 0, -80);
  textButton('MUSIC:' + music, textMedium, 5, textColor, primaryHoverColor, 0, -30);
  textButton('-BACK-', textMedium, 5, textColor, secondaryHoverColor, 0, 40);
}

function settingsMouseClicked() {
  textSize(40);

  objectOver(0, -80, textWidth('THEME:' + theme), textMedium + 5, () => {
    tick.play();
    renderTheme();
  });

  objectOver(0, -30, textWidth('-BACK-') / 2, textMedium + 5, () => {
    tick.play();

    if (music == 'ON') {
      music = 'OFF';
      themeSound.stop();
    } else {
      music = 'ON';
      themeSound.play();
    }
  });

  objectOver(0, 40, textWidth('-BACK-') / 2, textMedium + 5, () => {
    tick.play();

    page = 'MainMenu';
  });
}

function renderTheme() {
  switch (theme) {
    case 'DARK':
      lightTheme();
      break;
    case 'LIGHT':
      colorfullTheme();
      break;
    case 'COLORFULL':
      darkTheme();
      break;
    default:
      console.log('unknown color theme');
      break;
  }
}

function darkTheme() {
  theme = 'DARK';
  bgColor = 30;
  textColor = '#f2f2f2';
  primaryHoverColor = '#87f49a';
  secondaryHoverColor = '#fcba03';
}

function lightTheme() {
  theme = 'LIGHT';
  bgColor = '#d9d9d9';
  textColor = '#0d0401';
  primaryHoverColor = '#16cc5c';
  secondaryHoverColor = '#fcba03';
}

function colorfullTheme() {
  theme = 'COLORFULL';
  bgColor = '#4195f0';
  textColor = '#542a91';
  primaryHoverColor = '#b2f007';
  secondaryHoverColor = '#e637c0';
}
