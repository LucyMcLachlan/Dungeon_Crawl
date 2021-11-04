class Bullet extends GameObject{

  //instance var
  int timer;
  int bulletsize;
  PVector bulletVector;
  //constructor
  Bullet(PVector speed,int size) {
    timer =  50;
    hp =  1;
    size  =  10;
    loc   =  new PVector(myHero.loc.x,myHero.loc.y);
    vel=speed;
    vel.add(myHero.vel);
    vel.setMag(10);
    bulletsize=size;
    roomX=myHero.roomX;
    roomY=myHero.roomY;
  }
   
   void show(){
     stroke(255);
     noFill();
     circle(loc.x, loc.y, bulletsize);
   }
   
   void act(){
     
   super.act();
   
   timer--;
   if(timer == 0){
     hp=0;
   }
   
   if (loc.x>710) {
    hp=0;
    }
    if (loc.x<90) {
     hp=0;
    }
    if (loc.y>530) {
      hp=0;
    }
    if (loc.y<height*0.12) {
      hp=0;
    }
   
   }




}
