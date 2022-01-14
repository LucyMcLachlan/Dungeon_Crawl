class bigSlime extends Enemy {


  Gifs CurrentAction;

  bigSlime(int x, int y, int z) {

    super(100, 75, x, y, z);
    xp=10;
    CurrentAction=SlimeLeft;
  }
bigSlime(int locX,int locY,int x, int y, int z) {

    super(100, 75, x, y, z);
    loc = new PVector(locX,locY);
    xp=10;
    CurrentAction=SlimeLeft;
  }

  void show() {

    fill(0);
    textSize(20);
    text(hp, loc.x, loc.y-30);
    CurrentAction.show(loc.x, loc.y, size*1.75, size*1.75);
  }

  void act() {
    

    super.act();

    vel = new PVector (myHero.loc.x-loc.x, myHero.loc.y-loc.y);
    vel.setMag(1.5);


    if (vel.x > 0) CurrentAction=SlimeRight;
    else CurrentAction=SlimeLeft;
    
    if (hp<=0) {
      myObjects.add(new Slime(loc.x+50, loc.y+50, roomX, roomY, roomZ)); 
      myObjects.add(new Slime(loc.x-50, loc.y-50, roomX, roomY, roomZ));
    }
  }
}
