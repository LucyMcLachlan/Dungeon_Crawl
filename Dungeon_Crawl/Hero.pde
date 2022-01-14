class Hero extends GameObject {

  int immunity=0;
  int floor;
  Gifs CurrentAction;
  
  Hero() {
    loc   = new PVector (width/2, height/2);
    vel   = new PVector(0, 0);
    hp    = 200;
    MaxHP = 200;
    speed = 5;
    roomX = 1;
    roomY = 1;
    roomZ = 1;
    damage = 5;
    size  = 40;
    floor = 1;
    c = #226756;
    CurrentAction=CyclopsDown;
  }
  void show() {
    /*stroke(0);
    fill(c);
    circle(loc.x, loc.y, size);*/
    fill(0);
    textSize(20);
    text(hp, loc.x, loc.y-70);
    CurrentAction.show(loc.x,loc.y, size*1.5,size*2);
  }


  void act() {
    super.act();
    if (wkey)vel.y = -speed;
    if (skey)vel.y = speed;
    if (akey)vel.x = -speed;
    if (dkey)vel.x = speed;

    if (!wkey&&!skey)vel.y=vel.y*0.75;
    if (!akey&&!dkey)vel.x=vel.x*0.75;

    if (wkey && dkey||wkey&& skey||akey&&skey||dkey&&skey)vel.setMag(speed);


    int i=0;
    while (i< myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Enemy && immunity>159 ) {
        if (myHero.roomX == myObj.roomX && myHero.roomY == myObj.roomY &&myHero.roomZ == myObj.roomZ) {
          float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
          if (d <= size/2 + myObj.size/2) {
            hp = hp - int(myObj.vel.mag());
            immunity = 0;
          }
        }
      } else immunity++;  
      if (myObj instanceof DroppedItem) {
        if (myHero.roomX == myObj.roomX && myHero.roomY == myObj.roomY && myHero.roomZ == myObj.roomZ) {
          float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
          if (d <= size/2 + myObj.size/2) {
            
            DroppedItem item = (DroppedItem)myObj;
            if (item.type == SPELL) {
              myWeapon = item.w;
              item.hp = 0;
            }
            else if (item.type == HEALTH) {
              myHero.hp=myHero.hp+20;
              item.hp = 0;
            }
          }
        }
      }
      i++;
    }

    int ii = 0;
    while (ii< myObjects.size()) {
      GameObject myObj = myObjects.get(ii);
      if (myObj instanceof EnemyBullet && immunity>159) {
        float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
        if (d<= size/2 + myObj.size/2) {
          hp = hp - int(myObj.vel.mag());
          myObj.hp = 0;
          immunity = 0;
        }
      } else immunity++;  
      ii++;
    }

    if (northRoom != #FFFFFF && loc.x >= width/2-50 && loc.x <= width/2+50 &&loc.y == height*0.1) {
      roomY--;

      loc= new PVector(width/2, height*0.9-10);
    }
    if (eastRoom != #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-50&& loc.y <= height/2+50) {
      roomX++;
      loc= new PVector(width*0.1+10, height/2);
    }
    if (southRoom != #FFFFFF&& loc.x >= width/2-50 && loc.x <= width/2+50 &&loc.y == height*0.9) {
      roomY++;
      loc= new PVector(width/2, height*0.1+10);
    }
    if (westRoom != #FFFFFF&& loc.x == width*0.1 && loc.y >= height/2-50&& loc.y <= height/2+50) {
      roomX--;
      loc = new PVector(width*0.9-10, height/2);
    }
  
   if(myHero.hp>myHero.MaxHP)myHero.hp=myHero.MaxHP;
    myWeapon.update();
    if (spacekey)myWeapon.shoot();
    
    if(abs(vel.y)>abs(vel.x)){ 
      if(vel.y>0)CurrentAction =CyclopsDown;
      else CurrentAction = CyclopsUp;
    }else{
      if (vel.x > 0) CurrentAction=CyclopsRight;
      else CurrentAction=CyclopsLeft;
    }
}
}
