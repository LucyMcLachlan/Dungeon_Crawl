class Ice extends Weapon{

  Ice(){
    super(60,3);
    Shoot=2;
  }
  
  void shoot(){
    if(shotTimer >= threshold){
    PVector aimVector = new PVector (mouseX-myHero.loc.x,mouseY-myHero.loc.y);
    aimVector.setMag(bulletSpeed);
    myObjects.add(new Bullet(aimVector,10)); 
    myObjects.add(new Bullet(aimVector,10));
    myObjects.add(new Bullet(aimVector,10));
    shotTimer=0;
  }

}}
