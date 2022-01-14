class Message extends GameObject {

  String txt;
  int transparency;
  int timer;
  Message(PVector _loc, String a) {
    loc =_loc;
    txt = a;
    roomX=myHero.roomX;
    roomY=myHero.roomY;
    roomZ=myHero.roomZ;
    hp=1;
    transparency=150;
    timer = 0;
    vel=new PVector(0, 0);
  }

  void show() {

    textSize(20);
    fill(black, transparency);
    text(txt, loc.x, loc.y);
  }

  void act() {
    transparency--;
    loc.y--;
    if(transparency<=0)hp=0;
  }
}
