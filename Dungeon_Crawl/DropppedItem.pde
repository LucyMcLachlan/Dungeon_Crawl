class DroppedItem extends GameObject {

  int type;
  Weapon w;

  DroppedItem(float x, float y, int rx, int ry, int rz) {
    int r= int(random(1, 3));
    if (r==1) {
      type  = HEALTH;

      hp    = 1;
      loc   = new PVector(x, y);
      vel   = new PVector(0, 0);
      size  = 20;
      roomX = rx;
      roomY = ry;
      roomZ = rz;
      c     = pink;
    }
    if (r==2) {
      type  = SPELL;
      int r2;
      r2 = int(random(1,4));
      if(r2==1)w = new LightningBolt();
      if(r2==2)w = new Ice();
      if(r2==3)w = new poisonDart();
      hp    = 1;
      loc   = new PVector(x, y);
      vel   = new PVector(0, 0);
      size  = 20;
      roomX = rx;
      roomY = ry;
      roomZ = rz;
      c = purple;
    }
  }

 
  void show() {

    fill(c);
    circle(loc.x, loc.y, size);
    
    if(type==HEALTH){
    heartPotion.show(loc.x,loc.y,size,size);
    }
  }

  void act() {
  }
}
