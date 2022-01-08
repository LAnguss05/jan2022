class Dropitem extends GameObject {
  int type;
  Weapon w;
  int items;

  Dropitem (float x, float y, int rx, int ry) {

    //if statement for items (guns + immune)
    items= int (random (0, 2));
    if ( items ==0) {
      type=IMMUNE;
      c=white;
    } else
      if (items==1) {
        type= GUN;
        int randomweapon = int( random(0, 3));
        if (randomweapon ==1) w= new AutoPistol ();
        if (randomweapon ==0) w= new ShotGun ();
        if (randomweapon ==2) w= new SniperRifle ();
        c = lavander;
      }

    hitpoint=1;
    loc = new PVector (x, y);
    vel= new PVector (0, 0);
    size=40;
    roomX=rx;
    roomY=ry;
  }

  void show () {
    // when to show if statements 
    if (type==GUN) {
      fill (c);
      circle (loc.x, loc.y, size);
    } else
      if (type == IMMUNE) {
        fill (c);
        circle (loc.x, loc.y, size);
        fill (c);
        circle (loc.x, loc.y, size);
      }
  }


  void act () {
  }
}
