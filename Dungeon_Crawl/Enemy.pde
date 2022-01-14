class Enemy extends GameObject {


  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp=100;
    roomX=1;
    roomY=1;
    roomZ=1;
    size=50;
  }


  Enemy(int _hp, int s, int x, int y, int z) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp= _hp;
    roomX=x;
    roomY=y;
    roomZ=z;
    size=s;
  }

  void show() {

    stroke(0);
    strokeWeight(2);
    fill(#5A83C6);
    circle(loc.x, loc.y, size);
    fill(0);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    int i=0;
    while (i< myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
        if (d<= size/2 + myObj.size/2) {
          hp = hp - myHero.damage;
          myObj.hp=0;
          if (hp<=0) {
            myHero.xp=myHero.xp+xp;
            myObjects.add(new Message(loc,"+"+xp));
            int r = int(random(0,101));
            if (r > 40) {
              myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY, roomZ));
            }
          }
        }
      }
      i++;
    }
  }
}
