class Hero extends GameObject {

  float speed;
  
  int floor;
  Hero() {
    loc = new PVector (width/2, height/2);
    vel = new PVector(0, 0);
    hp  = 1;
    speed = 5;
    roomX = 1;
    roomY = 1;
    floor=1;
  }
  void show() {
    stroke(0);
    fill(#BBBEA1);
    circle(loc.x, loc.y, 40);
  }


  void act() {
    if (wkey)vel.y=-speed;
    if (skey)vel.y=speed;
    if (akey)vel.x=-speed;
    if (dkey)vel.x=speed;

    if (!wkey&&!skey)vel.y=vel.y*0.75;
    if (!akey&&!dkey)vel.x=vel.x*0.75;

    if (wkey && dkey||wkey&& skey||akey&&skey||dkey&&skey)vel.setMag(speed);
    loc.add(vel);

    if (loc.x>720) {
      loc.x=720;
    }
    if (loc.x<80) {
      loc.x=80;
    }
    if (loc.y>540) {
      loc.y=540;
    }
    if (loc.y<height*0.1) {
      loc.y=height*0.1;
    }


    if (northRoom != #FFFFFF && loc.x >= width/2-50 && loc.x <= width/2+50 &&loc.y == height*0.1) {
      roomY--;
      addLadder();
      
      loc= new PVector(width/2, height*0.9-10);
    }
    if (eastRoom != #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-50&& loc.y <= height/2+50) {
      roomX++;
      addLadder();
      loc= new PVector(width*0.1+10, height/2);
    }
    if (southRoom != #FFFFFF&& loc.x >= width/2-50 && loc.x <= width/2+50 &&loc.y == height*0.9) {
      roomY++;
      addLadder();
      loc= new PVector(width/2, height*0.1+10);
    }
    if (westRoom != #FFFFFF&& loc.x == width*0.1 && loc.y >= height/2-50&& loc.y <= height/2+50) {
      roomX--;
      addLadder();
      loc= new PVector(width*0.9-10, height/2);
    }
    
  }
}
