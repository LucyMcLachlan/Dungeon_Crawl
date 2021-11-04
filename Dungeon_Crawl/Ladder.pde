class Ladder  extends GameObject {

  int i=0;
  int size=60;


  Ladder(float _x, float _y) {
    loc= new PVector(_x, _y);
    hp=1;
    println("LADDER IS HERE!");
    vel = new PVector(0, 0);
    roomX=2;
    roomY=1;
  }

  void show() {

    stroke(0);
    strokeWeight(2);
    fill(49);
    circle(loc.x, loc.y, size);
  }

  void act() {

    if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y)<size/2 + ladder.size/1.5) {
      myHero.floor++; 
      myHero.roomX=1; 
      myHero.roomY=1;
    }
  }
}
