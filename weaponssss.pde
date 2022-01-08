class ShotGun extends Weapon { 

  ShotGun () { 
    super (100, 20);
  } 
  void shoot () { // 
    if  ( shottimer >= threshold ) { 
      for ( int i=0; i <30; i++ ) {
        PVector aimVector= new PVector (mouseX-myHero.loc.x, mouseY-myHero.loc.y); 
        aimVector.rotate (random (-PI, PI  ));
        aimVector.setMag (bulletSpeed); 
        myObjects.add (new Bullet(aimVector, lemon, 10, 5));
      }
      shottimer=0;
    }
  }
}
