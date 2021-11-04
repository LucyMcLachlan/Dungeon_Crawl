class GameObject {
  PVector loc;
  PVector vel;
  int hp;
  int size;
  int roomX, roomY;
  
  GameObject() {
  }

  void show() {
  }

  void act() {
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
  }
}
