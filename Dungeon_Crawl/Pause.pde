void pause() {
  textAlign(CENTER);
  textSize(90);
  text("PAUSED", width/2, height/2);
  playButton.show();
  if (playButton.clicked)mode=Game;
  
}
