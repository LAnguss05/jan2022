void win () {
  //background
  background (bkg);



  //GIF
  iGIF.show();
  //restartButton.show ();

  //button 
  textSize(50);
  fill (peach);

  fill (255);
  textFont(text3);
  text ("Click to Return Home", 395, 500);
  textFont (dungeon);
  text ("YOU WIN", 395, 100);

  //if (restartButton.clicked) { 
  //  mode= INTRO; 
  //}
}



void  winClicks () {
  reset ();
  if (dist(0, 0, mouseX, mouseY) <=1000) {
    mode=INTRO;
  }
}
