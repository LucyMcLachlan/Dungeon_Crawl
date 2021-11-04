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

Gifs introGif, endGif;

ArrayList<GameObject> myObjects;
ArrayList<Dark> darkness;
Hero myHero;
Ladder ladder;
PImage map, map2, map3;
color northRoom, eastRoom, southRoom, westRoom;

Weapon myWeapon;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  mode=Intro;
  introGif = new Gifs(15, 2, "frame_", "_delay-0.04s.gif");
  introGif.loadImages("frame_", "_delay-0.04s.gif");
  startButton = new Buttons("Start", width/2, height/9, 200, 100, #356059, #BBBEA1);
  pauseButton = new Buttons("||", width/9, height-50, 50, 50, #FFFFFF, 0);
  playButton = new Buttons(">", width/9, height-50, 50, 50, #FFFFFF, 0);
  myObjects = new ArrayList<GameObject>();
  myHero= new Hero();
  myObjects.add(myHero);

  ladder= new Ladder(random(100, width-100), random(100, height-100));
  myObjects.add(ladder);
  
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
  
  myWeapon= new Ice();
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
  if(keyCode==' ')spacekey=true;
}

void keyReleased() {
  if (key =='w'||key=='W')wkey=false;
  if (key =='a'||key=='A')akey=false;
  if (key =='s'||key=='S')skey=false;
  if (key =='d'||key=='D')dkey=false;
  if(keyCode==' ')spacekey=false;
}
