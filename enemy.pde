class Enemy extends GameObject {

  int damages;
  Enemy () {
    loc= new PVector (width/2, height/2);
    vel= new PVector (0, 0);
    size=50;
    hitpoint=100;
    roomX=1;
    roomY=1;
    xp=1;
  }

  Enemy (int x, int y) {
    loc= new PVector (width/2, height/2);
    vel= new PVector (0, 0);
    size=50;
    hitpoint=100;
    roomX=x;
    roomY=y;
  }

  Enemy ( int hp, int s, int x, int y, int damages) {
    loc= new PVector (width/2, height/2);
    vel= new PVector (0, 0);
    hitpoint= hp;
    size=s;
    roomX= x;
    roomY=y;
    damage= damages;
  }

  void show () {

    stroke (black);
    strokeWeight (2);
    fill (green);
    circle (loc.x, loc.y, size);
    textSize (20);
    text (hitpoint, loc.x, loc.y);
  }

  void act () {
    super.act ();
    //collision detection code
    int i=0;
    while (i < myObjects.size ()) {
      GameObject obj= myObjects.get (i);
      if (obj instanceof Bullet && isCollidingWith (obj)) {
        hitpoint= hitpoint - int (obj.vel.mag ());
        hitpoint= hitpoint - obj.damage;
        obj.hitpoint=0;
        if (hitpoint <= 0) {
          if (random (0, 85)> 40)  myObjects.add (new Dropitem (loc.x, loc.y, roomX, roomY));
          myHero.xp= myHero.xp+5;
          myObjects.add ( new message ());
      
        }
      }
      i++;
    }
  }
}
