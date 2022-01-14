void pause() {
  background(green);
  textAlign(CENTER);
  textSize(30);
  fill(blue);
  text("You have "+myHero.xp+" experience", width/3, height/9);

  text("Max hp = " + myHero.MaxHP, width/3, height-400);
  text("Speed = "+ myHero.speed, width/3, height-300);
  text("Damage = "+ myHero.damage, width/3, height-200);
  hpButton.show();
  if (hpButton.clicked) {
    if (myHero.MaxHP<220) {
      if (myHero.xp>=5) {
        myHero.MaxHP=myHero.MaxHP+5;
        myHero.hp=myHero.hp+5;
        myHero.xp=myHero.xp-5;
      }
    } else if (myHero.MaxHP<250) {
      if (myHero.xp>=10) {
        myHero.MaxHP=myHero.MaxHP+5;
        myHero.xp=myHero.xp-10;
      }
    }
  }
  speedButton.show();
  if (speedButton.clicked) {
    if (myHero.speed<4) {
      if (myHero.xp>=5) {
        myHero.speed=myHero.speed+1;
        myHero.xp=myHero.xp-5;
      }
    } else if (myHero.speed<8) {
      if (myHero.xp>=10) {
        myHero.speed=myHero.speed+1;
        myHero.xp=myHero.xp-10;
      }
    }
  }

  damageButton.show();

  if (damageButton.clicked) {
    if (myHero.damage<8) {
      if (myHero.xp>=5) {
        myHero.damage=myHero.damage+1;
        myHero.xp=myHero.xp-5;
      }
    } else if (myHero.damage<12) {
      if (myHero.xp>=10) {
        myHero.damage=myHero.damage+1;
        myHero.xp=myHero.xp-10;
      }
    } else if (myHero.damage<16) {
      if (myHero.xp>=15) {
        myHero.damage=myHero.damage+1;
        myHero.xp=myHero.xp-15;
      }
    }
  }
  playButton.show();
  if (playButton.clicked)mode=Game;
}
