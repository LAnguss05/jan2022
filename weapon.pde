class Weapon {

  int shottimer;
  int threshold;
  int bulletSpeed;


  Weapon () {

    shottimer= 0;
    threshold= 30;
    bulletSpeed= 5;
  }

  Weapon ( int thr, int bs) {

    shottimer= 0;
    threshold= thr;
    bulletSpeed = bs;
  }

  void update () {

    shottimer++;
  }

  void shoot () {
    if  ( shottimer >= threshold ) {
      PVector aimVector= new PVector (mouseX-myHero.loc.x, mouseY-myHero.loc.y);
      aimVector.setMag (bulletSpeed);
      myObjects.add (new Bullet(aimVector, lemon, 10, 3));
      shottimer=0;
    }
  }
}
