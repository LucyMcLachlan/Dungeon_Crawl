class Slime extends Enemy{

    Gifs CurrentAction;
  
    Slime(int x, int y, int z){
     
      super(50,50,x,y,z);
       xp=10;
       CurrentAction=SlimeLeft;
    }
    Slime(float locX,float locY,int x, int y, int z){
     
      super(50,50,x,y,z);
      loc.x=locX;
      loc.y=locY;
       xp=10;
       CurrentAction=SlimeLeft;
    }
    void show() {

    /*stroke(0);
    strokeWeight(2);
    fill(#94BDC6);
    circle(loc.x, loc.y, size);
    fill(0);
    textSize(20);
    text(hp, loc.x, loc.y);*/
    fill(0);
    textSize(20);
    text(hp, loc.x, loc.y-30);
    CurrentAction.show(loc.x,loc.y,size*1.5,size*1.5);
  }
  
  void act(){
    
    super.act();
    
    vel = new PVector (myHero.loc.x-loc.x, myHero.loc.y-loc.y);
    vel.setMag(1.5);
    
 
      if (vel.x > 0) CurrentAction=SlimeRight;
      else CurrentAction=SlimeLeft;
    }

}
