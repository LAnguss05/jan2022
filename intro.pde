void intro () {
  //background
  background (bkg);

  //GIF
  introsGIF.show();
  introButton.show ();

  //button
  textSize(50);
  fill (peach);

  fill (255);
  textFont(dungeon);
  text ("Dungeon RPG Game", 395, 100);
  textFont(text3);
  text ("Note: Use the tkey to Teleport", 395, 500);
  text ("To Win, try to have hpMax up to 220, and hitpoint to 120", 400, 550);


  if (introButton.clicked) { 
    mode= GAME;
  }
}
