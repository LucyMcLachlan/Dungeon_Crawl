class Lurker extends Enemy {


  Lurker(int x, int y, int z) {
    super(100, 50, x, y, z);
  }

  void show() {

    stroke(0);
    strokeWeight(2);
    fill(#94BDC6);
    circle(loc.x, loc.y, size);
    fill(0);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {

    super.act();

    if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y)<size*3+myHero.size*3) {
      vel = new PVector (myHero.loc.x-loc.x, myHero.loc.y-loc.y);
      vel.setMag(3);
    } else vel =new PVector(0, 0);
  }
}
