class messages extends GameObject {


  int times;


  messages () {
    loc= new PVector (myHero.loc.x, myHero.loc.y);
    hitpoint=5;
    roomX=  myHero.roomX;
    roomY= myHero.roomY;
    times=150;
  }

  void show () {
    if ( times> 0) {
      times= times-1;


fill (white);
      stroke (white);
      textSize (20);
      text ("+ 90XP", myHero.loc.x, myHero.loc.y-40);
    }
  }



  void  act () {
    println (times); 

    int l = 0;
    while (l < myObjects.size()) {
      GameObject obj = myObjects.get(l);
      l++;
      if (times <= 0) {

        if (times <= 0) {
          if ( obj instanceof Enemy) {
            if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <  obj.size) {


              times = 150;
            }
          }
        }
      }
    }
  }
}
