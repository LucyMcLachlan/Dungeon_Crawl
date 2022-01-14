class Turret extends Enemy {
  int shotTimer;
  int threshold;
  int bulletSpeed;
  

  Turret(int x, int y,int z,float _locX, float _locY) {
   
    super(50, 50, x, y, z);
     xp=15;
    loc=new PVector (_locX,_locY);
    shotTimer=0;
    threshold =60;
    bulletSpeed =5;
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
   
     if (shotTimer >= threshold) {
      PVector aimVector = new PVector (myHero.loc.x-loc.x, myHero.loc.y-loc.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new EnemyBullet(aimVector, loc, 10));
      shotTimer=0;
    }else shotTimer++;
  }
}
