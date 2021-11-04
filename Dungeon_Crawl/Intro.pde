void intro(){
  background(#CF8A69);
imageMode(CENTER);

introGif.show();
startButton.show();
if(startButton.clicked){
  mode=Game;
}
}
