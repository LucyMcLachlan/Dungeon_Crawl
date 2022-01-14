void game() {

  drawRoom();

  drawGameObjects();
  Darkness();
  drawMap();
  if(lv2==0 && myHero.roomX==2){
    Lv2Enemies();
    lv2++;
  }
  pauseButton.show();
  
  if (pauseButton.clicked)mode=Pause;
  if (myHero.hp<=0)mode=GameOver;
}

void drawRoom() {
  rectMode(CORNER);
  background(#E0C3A3); 
  stroke(0); 
  line(0, 0, width, height); 
  line(width, 0, 0, height); 

  //draw exits
  image(map, width/2, height/20);
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom  = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom  = map.get(myHero.roomX-1, myHero.roomY);
  noStroke();
  fill(0);
  if (northRoom != white) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom != white) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != white) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != white) {
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
    if (myHero.roomX == myObj.roomX && myHero.roomY == myObj.roomY && myHero.roomZ == myObj.roomZ) {
      myObj.show();
      myObj.act();
    }
    if (myObj.hp <= 0) println(myObjects.remove(i));
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
  noStroke();
  if (myHero.roomZ == 1) map = loadImage("map 1.png");
  if (myHero.roomZ == 2) {
    map = map2;
  }

  // if (myHero.floor==3)map = map3;
  float mapS = 8;
  int mapX = 0, mapY = 0;
  while (mapY < map.height) {
    color c = map.get(mapX, mapY);
    fill(c);
    if (myHero.roomX*7+20 == mapX*7+20 && myHero.roomY*7+20 == mapY*7+20 )fill(#BBBEA1);
    square(mapX*7+20, mapY*7+20, mapS);
    mapX += 1;
    if (mapX >= map.width) {
      mapX=0;
      mapY += 1;
    }
  }
}

void Lv2Enemies() {

  int x=0;
  int y=0;
  int z=2;
  map=map2;
  while (y < map.height) {
    color roomColor=map.get(x, y);

    if (roomColor == red) {
      myObjects.add(new Turret(x, y, z, width/6, height/3));
    }
    if (roomColor==blue) {
      myObjects.add(new bigSlime(400,300,x, y, z));
      myObjects.add(new bigSlime(200,700,x, y, z));
    }
    if (roomColor==purple){
      myObjects.add(new bigSlime(x, y, z));
    }
    if (roomColor==green){
      myObjects.add(new bigSlime(x, y, z));
       myObjects.add(new Turret(x, y, z, width/random(3,5), height/random(1,4)));
    }
    if (roomColor == teal ||roomColor == pink) {
      myObjects.add(new Ladder(x, y, z));
    }
    x++;
    if (x == map.width) {
      x=0;
      y++;
    }
  }
}
