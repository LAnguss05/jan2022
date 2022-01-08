class Hero extends GameObject {

  Weapon myWeapon;
  int immunity;
  int teleport; 
  int myman;
  Hero () {

    super ();
    hpMax=hitpoint=100;
    myman=1;
    roomX= 1;
    roomY=1;
    speed=5;
    immunity=250;
    myWeapon = new AutoPistol () ;
    myman=1;
    size=70;
    teleport= 200;
  }



  void show () {
    if (myman ==1)  manUp.show (loc.x, loc.y, size, size);
    if (myman ==2)  manDown.show (loc.x, loc.y, size, size);
    if (myman ==3)  manRight.show (loc.x, loc.y, size, size);
    if (myman ==4)  manLeft.show (loc.x, loc.y, size, size);

    fill (white);
    textSize (20);
    text (hitpoint, loc.x, loc.y);
    strokeWeight (3);
//immunity 

    if ( immunity > 0) {
      immunity= immunity-1;



      fill (#58EACC);
      if (myman ==1)  manUp.show (loc.x, loc.y, size, size);
      if (myman ==2)  manDown.show (loc.x, loc.y, size, size);
      if (myman ==3)  manRight.show (loc.x, loc.y, size, size);
      if (myman ==4)  manLeft.show (loc.x, loc.y, size, size);
      stroke (white);
      textSize (20);
      text (hitpoint, loc.x, loc.y);
    }




    //teleport

    teleport = teleport + 3;
    if (teleport >= 200) {
      fill(#FFFFFF);
      noStroke();
      teleport = teleport + 3;
    }
  }



  void act () {
    super.act ();


    println (immunity);

    int k = 0;
    while (k < myObjects.size()) {
      GameObject obj = myObjects.get(k);
      //if (myObj instanceof EnemyBullet && isCollidingWith (myObj)) {

      k++;

//immunity 
      if (immunity <= 0) {
        if (obj instanceof Enemy) {
          if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <  obj.size) {

            hitpoint= hitpoint-10;
            immunity = 250;
          }
        }
      }
    }
    if (wkey) vel.y= -speed;
    if (akey) vel.x= -speed;
    if (skey) vel.y= speed;
    if (dkey) vel.x= speed;

    if (vel.mag () > speed)
      vel.setMag (speed);


    if (!wkey && !skey) vel.y= vel.y *0.5;
    if (!akey && !dkey) vel.x= vel.x * 0.5;



    if (abs (vel.y) > abs ( vel.x)) {
      if (vel.y > 0) myman=1;
      else  myman=2;
    } else {
      if  (vel.x > 0) myman=3;
      else myman=4;
    }

    // north
    if (northRoom != #FFFFFF && loc.y== height*0.1 && loc.x >= width/2-50 && loc.x <=width/2+50) {
      roomY= roomY-1;
      loc = new PVector (width/2, height*0.9-10);
    }


    //east
    if (eastRoom !=  #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-50&& loc.y <=height/2+30) {
      roomX= roomX+1;
      loc = new PVector ( width*0.1+10, height/2);
    }

    //south
    if (southRoom != #FFFFFF && loc.y== height*0.9 && loc.x >= width/2-40 && loc.x <=width/2+40) {
      roomY= roomY+1;
      loc = new PVector ( width/2, height*0.1+10);
    }


    //west (works!)
    if (westRoom !=  #FFFFFF && loc.x== width*0.1&& loc.y >=height/2-20 && loc.y <=  height/2+50) {
      roomX= roomX-1;
      loc = new PVector ( width*0.9, height/2);
    }

    myWeapon.update () ;
    if ( spacekey) myWeapon.shoot ();

    if (myHero.hitpoint == 0) {
      mode= GAMEOVER;
    }

    //teleport
    if (tkey && teleport >= 200) {
      teleport = 0;
    loc = new PVector ( width*0.9, height/2);
       //loc = new PVector ( width/2, height*0.1+10);
    }

    //check collisions
    int i=0;


    while (i < myObjects.size ()) {
      GameObject myObj = myObjects.get (i);

      // colliding code
      if (myObj instanceof Dropitem && isCollidingWith(myObj)) {
        Dropitem item= (Dropitem)    myObj;
        if (item.type ==GUN) {
          myWeapon= item.w;
          item.hitpoint=0;//drop item code
        } else
          if (item.type ==IMMUNE ) {
            hitpoint= hitpoint+20;
            if (myHero.hitpoint >myHero.hpMax) myHero.hitpoint=myHero.hpMax;
            item.hitpoint=0;
          }

        if (myObj instanceof Bullet && isCollidingWith (myObj)) {
          hitpoint= hitpoint - int(myObj.vel.mag ());
          myObj.hitpoint=0;
          if (dist(myHero.loc.x, myHero.loc.y, myObj.loc.x, myObj.loc.y) < 5 + myObj.size/2) {
          }
        }
      }
      i++;
    }
  }
}
