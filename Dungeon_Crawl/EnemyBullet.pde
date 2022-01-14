class EnemyBullet extends GameObject {

  //instance var
  int timer;
  int bulletsize;
  PVector bulletVector;
  color c;
  //constructor
  EnemyBullet(PVector speed, PVector loca, int size) {
    timer =  50;
    hp =  1;
    size  =  10;
    int i=0;
    loc = loca.copy();
    //while (i< myObjects.size()) {
    //  GameObject myObj = myObjects.get(i);
    //  if (myObj instanceof Enemy) {
    //    loc   =  new PVector(myObj.loc.x, myObj.loc.y);
    //  }
    //  i++;
    //}

    vel=speed;
    vel.setMag(10);
    bulletsize=size;
    roomX=myHero.roomX;
    roomY=myHero.roomY;
    roomZ=myHero.roomZ;
  }

  void show() {
    stroke(255);
    noFill();
    circle(loc.x, loc.y, bulletsize);
  }

  void act() {

    super.act();

    timer--;
    if (timer == 0) {
      hp=0;
    }

    if (loc.x>710) {
      hp=0;
    }
    if (loc.x<90) {
      hp=0;
    }
    if (loc.y>530) {
      hp=0;
    }
    if (loc.y<height*0.12) {
      hp=0;
    }
  }
}
