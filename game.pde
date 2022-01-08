void game () {
  drawRoom ();
  drawGameObjects ();
  drawLightLayer ();
  drawMiniMap ();


  fill (aqua);

//Button 
  textFont(text5);
  text ("Pause", 730, 15);
  greenButton.show (); 
  if (greenButton.clicked ) { 
    mode=PAUSE;
  }

//button 
  fill (aqua);
  textFont(text5);
  text ("Give Up", 50, 470);
  quitButton.show ();
  if (quitButton.clicked ) { 
    mode=GAMEOVER;
  }
}

void drawRoom () {

  //background (#77ACF0);
  textFont (dungeons);

  //corners
  fill (#124079);
  stroke (black);
  strokeWeight (5);
  line (0, 0, width, height);
  line (width, 0, 0, height);

  gameGIF.show ();

  // Exits for North, East, South, West
  northRoom= map.get (myHero.roomX, myHero.roomY-1);
  eastRoom= map.get (myHero.roomX+1, myHero.roomY);
  westRoom= map.get (myHero.roomX-1, myHero.roomY);
  southRoom= map.get (myHero.roomX, myHero.roomY+1);

  //doors when it actually exits
  //remove white doors so its harder to find the exits 
  fill (white);
  if (northRoom!= #FFFFFF) {
    //ellipse (width/2, height*0.1, 100, 100);
  }

  if (eastRoom!= #FFFFFF) {
    //ellipse (width*0.9, height/2, 100, 100);
  }

  if (westRoom!= #FFFFFF) {
    //ellipse (width*0.1, height/2, 100, 100);
  }

  if (southRoom!= #FFFFFF) {
    //ellipse (width/2, height*0.9, 100, 100);
  }


  //manage DarknessCell, loop statement
  int b =0;
  while (b < darkness.size()) {
    DarknessCell a =darkness.get(b);
    a.show(); //size.show
    b=b+1;
  }
}

void drawGameObjects () { // this code includes manage hero too

  for (int i = 0; i < myObjects.size (); i++) {
    GameObject obj= myObjects.get (i);
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
      obj.show ();
      obj.act ();
      if (obj.hitpoint <=0) {
        myObjects.remove (i);
        i= i-1;
      }
    }
  }
}

void drawLightLayer () {
}


void drawMiniMap () {

  //MiniMap
  float size=10;
  int x = 0;
  int y = 0;



  noStroke();
  rectMode (CORNER);
  while (y < map.height) {
    fill (map.get(x, y), 100);

    square (x*size+49, y*size+27, size);
    x  = x+1;
    if (x >=map.width) {
      x=0;
      y= y+1;
    }

    //hero in the mini map
    float siza=10;
    color z= map.get (myHero.roomX, myHero.roomY);
    fill (rose);
    square (myHero.roomX*siza+49, myHero.roomY*siza+27, siza);
    if (tkey && teleport >=200) {
      teleport = 0;
    }
  }
} /////////////////////////// end of void drawMiniMap
