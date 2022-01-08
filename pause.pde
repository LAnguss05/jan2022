void pause () {
  background (aqua);
  
  introsGIF.show();
  whiteButton.show ();
  pauseButton.show ();
  pauseButton1.show ();
  pauseButton2.show ();


  textSize(30);
  fill(255);
  text ("YOU HAVE " + myHero.xp + "XP", 400, 100);
  textFont (text1);
  textSize (50);
  fill (aqua);
  text ("Character Advancement", 400, 50);

  fill (255);
  textSize(30);

  text ( "Hitpoint: " + myHero.hpMax, 260, 200);
  text( "Speed:   "  + myHero.speed, 260, 315);
  text("Plus 10 Immune: " + +myHero.hitpoint, 300, 415);


  if (whiteButton.clicked ) { 
    mode= GAME;
  }
  if ( myHero.xp >1 && pauseButton.clicked) {
    myHero.hpMax= myHero.hpMax+10;
    myHero.xp= myHero.xp-5;
  }  

  //  pauseButton1.show ();
  if (myHero.xp >15 && pauseButton1.clicked) {
    myHero.speed= myHero.speed + 1;
    myHero.xp= myHero.xp-20;
  }


  //  pauseButton2.show ();
  if (myHero.xp >20 && pauseButton2.clicked) {
    myHero.hitpoint= myHero.hitpoint +10;
    if (myHero.hitpoint >myHero.hpMax) myHero.hitpoint=myHero.hpMax;
    myHero.xp= myHero.xp-25;
  }
}
