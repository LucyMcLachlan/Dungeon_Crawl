class Weapon {

  int shotTimer;
  int threshold;
  int bulletSpeed;
  int Shoot;
  int numberOfBullets;
  Weapon() {

    shotTimer=0;
    threshold =30;
    bulletSpeed =5;
    Shoot=1;
    numberOfBullets=1;
  }

  Weapon(int thr, int bs, int nOb) {

    shotTimer=0;
    threshold = thr;
    bulletSpeed = bs;
    numberOfBullets=nOb;
  }

  void update() {
    shotTimer++;
  }
  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector (mouseX-myHero.loc.x, mouseY-myHero.loc.y);
      aimVector.setMag(bulletSpeed);
      int i=0;
      myObjects.add(new Bullet(aimVector, 10,#226756));
      shotTimer=0;
      while (i<numberOfBullets-1) {

        aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
        aimVector.setMag(bulletSpeed);
        aimVector.rotate(radians(random(-30, 30)));
        myObjects.add(new Bullet(aimVector, 10,#226756));
        shotTimer=0;
        i++;
      }
    }
  }
}
