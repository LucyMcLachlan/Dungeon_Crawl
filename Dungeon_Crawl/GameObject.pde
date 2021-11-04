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
  }
}
