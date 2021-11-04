class Weapon {

  int shotTimer;
  int threshold;
  int bulletSpeed;
  int Shoot;
  Weapon() {

    shotTimer=0;
    threshold =30;
    bulletSpeed =5;
    Shoot=1;
  }

  Weapon(int thr, int bs) {

    shotTimer=0;
    threshold = thr;
    bulletSpeed = bs;
  }

  void update() {
    shotTimer++;
  }
  void shoot(){
    if(shotTimer >= threshold){
    PVector aimVector = new PVector (mouseX-myHero.loc.x,mouseY-myHero.loc.y);
    aimVector.setMag(bulletSpeed);
    int i=0;
    while(i<6){
      aimVector.rotate(radians(random(-10,10)));
    myObjects.add(new Bullet(aimVector,10)); }
    shotTimer=0;
    i++;
  }

}
}
