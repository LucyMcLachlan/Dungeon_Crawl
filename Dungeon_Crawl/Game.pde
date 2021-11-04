void game() {
  drawRoom();

  Darkness();
  drawMap();
  drawGameObjects();
  pauseButton.show();
  if (pauseButton.clicked)mode=Pause;
}

void drawRoom() {
  rectMode(CORNER);
  background(#E0C3A3); 
  stroke(0); 
  line(0, 0, width, height); 
  line(width, 0, 0, height); 

  //draw exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom  = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom  = map.get(myHero.roomX-1, myHero.roomY);
  noStroke();
  fill(0);
  if (northRoom != #FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  stroke(0); 
  fill(#CF8A69);
  strokeWeight(3); 
  rect(80, 60, 640, 480);
}
void drawGameObjects() { 
  int i=0;
  while (i<myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    if (myHero.roomX == myObj.roomX && myHero.roomY == myObj.roomY) {
      myObj.show();
      myObj.act();
    }
    if (myObj.hp==0) myObjects.remove(i);
    else i++;
  }
}

void Darkness() {
  int i=0;
  while (i<darkness.size()) {
    Dark  d =darkness.get(i);
    d.show();

    i++;
  }
}
void drawMap() {
  if (myHero.floor==1) map = loadImage("map 1.png");
  if (myHero.floor==2)map = map2;
  // if (myHero.floor==3)map = map3;
  float mapS =8;
  int mapX=0, mapY=0;
  while (mapY < map.height) {
    color c = map.get(mapX, mapY);
    fill(c);
    if (myHero.roomX*7+50==mapX*7+50 && myHero.roomY*7+50==mapY*7+50 )fill(#BBBEA1);
    square(mapX*7+50, mapY*7+50, mapS);
    mapX += 1;
    if (mapX >= map.width) {
      mapX=0;
      mapY += 1;
    }
  }
}

void addLadder() {
  //float mapS =9;
  int Random = int(random(0, 10));
  println(Random>1);
  if (Random>1) {
    myObjects.add(ladder);
  }



}
