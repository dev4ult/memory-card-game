import processing.sound.*;
SoundFile tick, winSound, flip, themeSound;

void setupAllSound() {
  tick = new SoundFile(this, "../sound/tick.mp3");
  winSound = new SoundFile(this, "../sound/win.mp3");
  flip = new SoundFile(this, "../sound/flip.mp3");
  themeSound = new SoundFile(this, "../sound/themeSound.mp3");
}

void playFlipSound() {
  flip.play();
}

void playTickSound() {
  tick.play();
}

void playWinSound() {
  winSound.play();
}
