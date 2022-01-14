void gameOver() {
  background(#CE9CA3);
  textSize(20);
  text("GAMEOVER", width/2, height/2);

  endButton.show();
  if (endButton.clicked) {
    myHero = new Hero();
    lv2=0;
    int i=0;
    while (i< myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Enemy) {
        myObj.hp=0;
      }
    }
    map = loadImage("map 1.png");;
    int x=0;
    int y=0;
    int z=1;
    while (y < map.height) {
      color roomColor=map.get(x, y);
      if (roomColor == red) {
        myObjects.add(new Turret(x, y, z, width/2, height/2));
      }

      if (roomColor==blue) {
        myObjects.add(new Slime(x, y, z));
      }
      if (roomColor==purple) {
        myObjects.add(new bigSlime(x, y, z));
      }
      if (roomColor==green) {
        myObjects.add(new bigSlime(x, y, z));
        myObjects.add(new Turret(x, y, z, width/random(3, 5), height/random(1, 4)));
      }
      if (roomColor == teal ||roomColor == pink) {
        myObjects.add(new Ladder(x, y, z));
      }
      x++;
      if (x== map.width) {
        x=0;
        y++;
      }
    }
    
    myWeapon = new Ice();
    
     mode=Intro;
  }
}
