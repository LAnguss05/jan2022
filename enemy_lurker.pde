class Lurker extends Enemy {
  Lurker (int x, int y) {
    super (50, 60, x, y, 8);
    hitpoint=100;
    xp=1;
  }

  void show () {

    stroke (black);
    strokeWeight (2);
    fill (moss);
    circle (loc.x, loc.y, size);
    fill (255);
    textSize (20);
    text (hitpoint, loc.x, loc.y);
  }

  void act () {

    super.act ();
    loc.add (vel);
    //if (loc.x <= width*0.1 ) loc.x= width*0.1;
    //if (loc.x >= width*0.9) loc.x= width*0.9;
    //if (loc.y <= height*0.1) loc.y= height*0.1;
    //if (loc.y >= height*0.9) loc.y= height*0.9;


    if (dist (myHero.loc.x, myHero.loc.y, loc.x, loc.y) <150) {
      vel= new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      vel.setMag (2);
    }
  }
}
