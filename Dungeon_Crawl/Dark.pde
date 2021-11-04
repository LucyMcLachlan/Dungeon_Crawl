class Dark{

  float opacity;
  float x, y, d, size;

  Dark(float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 0;
  }

  void show() {
    noStroke();
    d = dist(myHero.loc.x, myHero.loc.y, x,y);
    opacity= map(d, 0, 400, 0, 255);
    fill(0, 0, 0, opacity);
    square(x, y, size);
  }

}
