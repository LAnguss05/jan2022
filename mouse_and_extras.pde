void mouseReleased () {
  if ( mode== GAMEOVER) {
    gameoverClicks ();
  } else 
  if ( mode== WIN) {
    winClicks ();
  } else {
    println ("Error: Mode= " + mode);
  }
} ///////////////////////////////////////end of void mouseReleased




void reset () { 



  myObjects= new ArrayList ();
  myObjects.add (myHero);
  myHero.roomX= 1;
  myHero.roomY=1;
  myHero.hitpoint = 100;
  myHero.hpMax=100;    
  myHero.myman=1;
  myHero.xp= 0;
  myHero.speed=5;
  myHero.immunity=250;
  myHero.myWeapon = new AutoPistol () ;
  myHero.loc= new PVector (width/2, height/2);
  myHero.vel= new PVector (0, 0);
  teleport=200;
  x= 0;
  y= 0; 
  myObjects.add (new  Follower  ( 1, 1));
  myObjects.add (new  Follower  ( 1, 2));
  myObjects.add (new  Follower  ( 1, 8));
  myObjects.add (new  Follower  ( 2, 3));
  myObjects.add (new  Follower  ( 2, 6));
  myObjects.add (new  Follower  ( 6, 8));
  myObjects.add (new  Follower  ( 7, 3));
  myObjects.add (new  Follower  ( 8, 6));
  myObjects.add (new  Follower  ( 8, 8));



  myObjects.add (new Lurker ( 2, 5));
  myObjects.add (new Lurker ( 3, 1));
  myObjects.add (new Lurker ( 3, 7));
  myObjects.add (new Lurker ( 4, 2));
  myObjects.add (new Lurker ( 7, 1));
  myObjects.add (new Lurker ( 7, 5));
  myObjects.add (new Lurker ( 7, 6 ));
  myObjects.add (new copyenemy (2, 8));
} 
