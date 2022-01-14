class Ladder  extends GameObject {

  int i=0;
  int size=60;


  Ladder(int _x, int _y, int _z) {
    loc= new PVector(width/2, height/2);
    hp=1;
    println("LADDER IS HERE!");
    vel = new PVector(0, 0);
    roomX=_x;
    roomY=_y;
    roomZ=_z;
  }

  void show() {

    stroke(0);
    strokeWeight(2);
    fill(49);
    circle(loc.x, loc.y, size);
  }

  void act() {

    if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y)<size/2 + myHero.size/2) {
      myHero.roomX=1; 
      myHero.roomY=1;
      if (myHero.roomZ==1) {
        myHero.roomZ=2;
      }
    }
  }
}
