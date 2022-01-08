class GameObject {


  PVector loc; //location
  PVector vel; //velocity
  // hit point
  int size;
  int roomX, roomY;
  int lives;
  color c;
  int damage;
  int hitpoint, hpMax;
  int xp;
  int speed; //gameobj

  GameObject () {
    loc= new PVector (width/2, height/2);
    vel= new PVector (0, 0);
    hitpoint=100;
    roomX=1;
    speed=5;
    roomY=1;
    c= rose;
  }


  boolean inRoomWith (GameObject myObj) {
    if (roomX == myObj.roomX && roomY == myObj.roomY)
      return true;
    else
      return false;
  }
  boolean isCollidingWith(GameObject myObj) {
    float d= dist (myObj.loc.x, myObj.loc.y, loc.x, loc.y);
    if (inRoomWith (myObj) && d < size/2 + myObj.size/2)
      return true;
    else
      return false;
  }

  void show () {
  }


  void act () {
    //move
    loc.add (vel);

    if (loc.x <= width*0.1 ) loc.x= width*0.1;
    if (loc.x >= width*0.9) loc.x= width*0.9;
    if (loc.y <= height*0.1) loc.y= height*0.1;
    if (loc.y >= height*0.9) loc.y= height*0.9;
  }
}

// boolean: return a true or false value
