const htmlDoc = document.documentElement;
const swapTheme = document.querySelector('#swap-theme');

let getDarkMode = localStorage.getItem('dark-mode');

let isDarkMode;

swapTheme.addEventListener('click', () => {
  isDarkMode = swapTheme.checked;
  if (isDarkMode) {
    htmlDoc.setAttribute('data-theme', 'business');
    localStorage.setItem('dark-mode', true);
  } else {
    htmlDoc.setAttribute('data-theme', 'lofi');
    localStorage.setItem('dark-mode', false);
  }
});

isDarkMode = JSON.parse(getDarkMode);

if (getDarkMode == null) {
  localStorage.setItem('dark-mode', false);
  getDarkMode = localStorage.getItem('dark-mode');
}

swapTheme.checked = isDarkMode;
if (isDarkMode) {
  htmlDoc.setAttribute('data-theme', 'business');
} else {
  htmlDoc.setAttribute('data-theme', 'lofi');
}

let language = localStorage.getItem('language');
const selectID = document.querySelector('#select-id');
const selectEN = document.querySelector('#select-en');

selectID.addEventListener('click', () => {
  localStorage.setItem('language', 'indonesia');
});

selectEN.addEventListener('click', () => {
  localStorage.setItem('language', 'english');
});

if (language == null) {
  localStorage.setItem('language', 'english');
  language = localStorage.getItem('language');
}

if (language == 'english') {
} else {
}
