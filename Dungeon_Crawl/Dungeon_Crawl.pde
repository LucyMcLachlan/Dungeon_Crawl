// Dungeon Crawl project
//Lucy McLachlan
int mode;
final int Intro=1;
final int Game=2;
final int Pause=3;
final int GameOver=4;

boolean mouseReleased;
boolean wasPressed;

boolean wkey, akey, skey, dkey, spacekey;
Buttons startButton, pauseButton, playButton, endButton;
Buttons hpButton, damageButton, speedButton;
//gifs
Gifs introGif, endGif;
Gifs CyclopsUp,CyclopsDown,CyclopsLeft,CyclopsRight;
Gifs SlimeLeft, SlimeRight;
Gifs heartPotion;

ArrayList<GameObject> myObjects;
ArrayList<Dark> darkness;
Hero myHero;
Ladder ladder;
PImage map, map2, map3;
color northRoom, eastRoom, southRoom, westRoom;

color black  = #000000;
color white  = #FFFFFF;
color purple = #73597f;
color blue   = #44627d;
color red    = #7f3930;
color green  = #758074;
color teal   = #447d74;
color pink   = #c681a4;

final int AMMO   = 0;
final int HEALTH = 1;
final int SPELL  = 2;

int lv2 = 0;

Weapon myWeapon;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  mode=Intro;
  
  //load gifs
  introGif = new Gifs(15, 2, "frame_", "_delay-0.04s.gif");
  introGif.loadImages("frame_", "_delay-0.04s.gif");
  
  CyclopsUp    = new Gifs(4,13,"cyclops/_up/cyclops_",".png");
  CyclopsDown  = new Gifs(4,13,"cyclops/_down/cyclops_",".png");
  CyclopsLeft  = new Gifs(4,13,"cyclops/_left/cyclops_",".png");
  CyclopsRight = new Gifs(4,13,"cyclops/_right/cyclops_",".png");
  
  
  SlimeRight = new Gifs(5,13,"slime/Slime_right/slime_",".png");
  SlimeLeft = new Gifs(5,13,"slime/Slime_left/slime_",".png");
  
  heartPotion = new Gifs(6,5,"heart potion/sprite_",".png");
  
  PImage snowflake;
  
  startButton  = new Buttons("Start", width/2, height/9, 200, 100, #356059, #BBBEA1);
  pauseButton  = new Buttons("||", width/9, height-50, 50, 50, #FFFFFF, 0);
  playButton   = new Buttons(">", width/9, height-50, 50, 50, #FFFFFF, 0);
  endButton    = new Buttons("Restart", width/2, height/9,200,100,#356059,#BBBEA1);
  hpButton     = new Buttons("+", width/8, height-400, 60,60,pink,blue);
  speedButton  = new Buttons("+", width/8, height-300, 60,60,pink,blue);
  damageButton = new Buttons("+", width/8, height-200, 60,60,pink,blue);
  myObjects    = new ArrayList<GameObject>();



  myHero= new Hero();
  myObjects.add(myHero);


  darkness = new ArrayList<Dark>(1000);
  rectMode(CORNER);
  float size =5;
  float darkX=0, darkY=0;

  while (darkY<height) {
    darkness.add(new Dark(darkX, darkY, size));
    darkX+=size;
    if (darkX>=width) {
      darkX=0;
      darkY += size;
    }
  }
  map =  loadImage("map 1.png");
  map2 = loadImage("map 2.png");
  map3 = loadImage("map 3.png");

  myWeapon = new Ice();

  //loading the enemies
  int x=0;
  int y=0;
  int z=1;
  while (y < map.height) {
    color roomColor=map.get(x, y);
    if (roomColor == red) {
      myObjects.add(new Turret(x, y, z, width/2, height/2));
    }

    if (roomColor==blue) {
      myObjects.add(new Slime(x, y, z));
    }
    if (roomColor==purple){
      myObjects.add(new bigSlime(x, y, z));
    }
    if (roomColor==green){
      myObjects.add(new bigSlime(x, y, z));
       myObjects.add(new Turret(x, y, z, width/random(3,5), height/random(1,4)));
    }
    if (roomColor == teal ||roomColor == pink) {
      myObjects.add(new Ladder(x, y, z));
    }
    x++;
    if (x== map.width) {
      x=0;
      y++;
    }
    
  }
  
  snowflake= loadImage("snowflake.png");
}


void draw() {
  if (mode == Intro)intro();
  else if (mode == Game)game();
  else if (mode == Pause)pause();
  else if (mode == GameOver)gameOver();

  click();
}

void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}

void keyPressed() {
  if (key =='w'||key=='W')wkey=true;
  if (key =='a'||key=='A')akey=true;
  if (key =='s'||key=='S')skey=true;
  if (key =='d'||key=='D')dkey=true;
  if (keyCode==' ')spacekey=true;
}

void keyReleased() {
  if (key =='w'||key=='W')wkey=false;
  if (key =='a'||key=='A')akey=false;
  if (key =='s'||key=='S')skey=false;
  if (key =='d'||key=='D')dkey=false;
  if (keyCode==' ')spacekey=false;
}
