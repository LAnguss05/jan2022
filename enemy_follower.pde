class Follower extends Enemy {
  Follower (int x, int y) {
    super (100, 50, x, y, 5);
    hitpoint=100;
    xp=1;
  }

  void show () {

    stroke (black);
    strokeWeight (2);
    fill (orangegreentea);
    circle (loc.x, loc.y, size);
    fill (black);
    textSize (20);
    text (hitpoint, loc.x, loc.y);
  }

  void act () {
    super.act ();

    vel= new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag (2);
  }
}
