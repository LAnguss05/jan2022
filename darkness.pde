class DarknessCell {
  float x, y, s;
  float distance; 
  float opacity;

  //Constructor
  DarknessCell (float _x, float _y, float asize) {
    x=_x;
    y=_y;
    s=asize;
    opacity= aqua;
  }

  void show () {
    opacity= map (distance, 0, 550, 0, 300);
    distance= dist ( x, y, myHero.loc.x, myHero.loc.y) ;
    noStroke();
    fill (0, opacity);
    rect (x, y, 10, 10);
  }


  void act () {
  }
} // end ofclass DarknessCell
