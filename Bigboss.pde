class copyenemy extends Enemy {
  int a=0;
  
  copyenemy (int x, int y) {
    super (100, 10, x, y, 5);
    size=80;
  }

  void show () {

    stroke (black);
    strokeWeight (2);
    fill (oceanblue );
    circle (loc.x, loc.y, size);
    textSize (20);
    text (hitpoint, loc.x, loc.y);
  }

  void act () {
    super.act ();
    if (dist (myHero.loc.x, myHero.loc.y, loc.x, loc.y) <100) {
      if (a==0 && hitpoint <= 100) {
        myObjects.add (new Follower2 (2, 8));
        a--;
      }
    }
  }
}
