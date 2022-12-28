const p4Btn = document.querySelector('#processing-btn');
const p5jsBtn = document.querySelector('#p5js-btn');

function toggleBtnClass(btn, anotherBtn) {
  btn.classList.remove('btn-outline');
  anotherBtn.classList.add('btn-outline');
}

const processingProgram = document.querySelector('#processing-program');
const p5jsProgram = document.querySelector('#p5-program');

function toggleDisplayProgram(program, anotherProgram) {
  program.classList.remove('hidden');
  anotherProgram.classList.add('hidden');
}

p4Btn.addEventListener('click', () => {
  toggleBtnClass(p4Btn, p5jsBtn);
  toggleDisplayProgram(processingProgram, p5jsProgram);
});

p5jsBtn.addEventListener('click', () => {
  toggleBtnClass(p5jsBtn, p4Btn);
  toggleDisplayProgram(p5jsProgram, processingProgram);
});

const backToTopBtn = document.querySelector('#back-to-top');

window.addEventListener('scroll', () => {
  if (window.scrollY > 300) {
    backToTopBtn.classList.remove('hidden');
  } else {
    backToTopBtn.classList.add('hidden');
  }
});
