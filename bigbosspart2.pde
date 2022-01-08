class Follower2 extends GameObject{
  
  
  int damages;
  Follower2 (){
    loc= new PVector (width/2, height/2);
    vel= new PVector (0, 0);
    size=50;
    hitpoint=100;
    roomX=1;
    roomY=1;
    xp=1;
  }

  Follower2(int x, int y) {
    loc= new PVector (width/2, height/2);
    vel= new PVector (0, 0);
    size=100;
    hitpoint=100;
    roomX=x;
    roomY=y;
  }

  Follower2 ( int hp, int s, int x, int y, int damages) {
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
    fill (black);
    circle (loc.x, loc.y, size);
    fill (white);
    textFont (text3);
    textSize (40);
    //text ("BYE", loc.x, loc.y);
    text (hitpoint, loc.x, loc.y);
  }


  void act () {
    super.act ();


    vel= new PVector (myHero.loc.x - loc.x-30, myHero.loc.y - loc.y);
    vel.setMag (2);
    if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) <  50) {
      myHero.hitpoint= myHero.hitpoint-myHero.hitpoint;
    } 
    //collision detection code
    int b=0;
    while (b < myObjects.size ()) {
      GameObject oobj= myObjects.get (b);
      if (oobj instanceof Bullet && isCollidingWith (oobj)) {

        hitpoint= hitpoint - int (oobj.vel.mag ());
        hitpoint= hitpoint - oobj.damage;
        oobj.hitpoint=0;
        if (hitpoint <= 0) {
          if (random (0, 100)> 40)  myObjects.add (new Dropitem (loc.x, loc.y, roomX, roomY));
          myHero.xp= myHero.xp+90;
          myObjects.add ( new messages ());
        
        }
      }
      b++;
    }
  }
}


//}



////      //float d= dist (obj.loc.x, obj.loc.y, loc.x, loc.y);
////      //if ( d <= size/2 + obj.size/2) {
//     hitpoint= hitpoint - int (obj.vel.mag ());
//     hitpoint= hitpoint - obj.damage;
////   obj.hitpoint=0;
////      mode= WIN;







//      } 
//    }
