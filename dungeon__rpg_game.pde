import processing.javafx.*; //for processing 4
//Angus Liu
// Dungeon RPG Game Project
//october 20 2021



//Notes: 
//Find the exits to go to the next room
//Special Feature: Big u win the big boss, u get bonus pts, but if u lose, gameover
//Second feature is to teleport to other rooms in the map 
//An giveup screen has been installed so that if you are out of xps or dropitems, etc, you 


// color pallette for the room, minimap, buttons, etc
color rose= #FFAFEB;
color peach= #F7B782;
color lemon= #FEFF00;
color mint=#56FA5F;
color aqua= #9DD4FF;
color lavander= #DBADF5;
color latte= #7C3C3C;
color taffy = #A06161;
color moss= #1A5020;
color espresso= #673C3C;
color orangegreentea= #FCD430;
color oceanblue = #3C84DB;
color b= #7cb1e2;
color g= #6feabd;
color blue   = #28E7ED;
color green  = #CEF255;
color pink   = #F76DDC;
color yellow = #FFF387;
color black  = #000000;
color white  = #FFFFFF;


//boolean keys
boolean wkey, akey, dkey, skey, tkey, spacekey;

//Images
color northRoom, eastRoom, southRoom, westRoom;
PImage map;
PImage i1;

// mini map
int mapheight;
int mapwidth;

//gif
AnimatedGIF introGIF;
AnimatedGIF introsGIF;
AnimatedGIF iGIF;
AnimatedGIF gameGIF;


//GameObjects
ArrayList <GameObject> myObjects;
Hero myHero;

//darkness
ArrayList <DarknessCell> darkness;
int x=0;
int y=0;
float asize=5;

//boolean
boolean mouseReleased;
boolean wasPressed;

//variable for buttons
Button introButton, greenButton, whiteButton, restartButton, quitButton, pauseButton, pauseButton1, pauseButton2;
color bkg;

//font
PFont dungeon;
PFont dungeons;
PFont text1;
PFont text2;
PFont text3;
PFont text4;
PFont text5;

//mode/different tabs
int mode;
final int INTRO= 0;
final int GAME= 1;
final int PAUSE=2;
final int GAMEOVER=3;
final int WIN=4;


int n;

//arraylist
ArrayList<Bullet> bulletList;


PImage Pic;
AnimatedGIF manDown;
AnimatedGIF manUp;
AnimatedGIF manLeft;
AnimatedGIF manRight;
PImage badboss;
PImage i; 



//settings: dropped item
final int AMMO =0;
final int IMMUNE=1;
final int  GUN=2 ;





int teleport = 200;
void setup() {


  mode= INTRO;
  size(800, 600, FX2D);


  bulletList = new ArrayList<Bullet>();
  //font
  dungeon= createFont ("Dungeons.ttf", 100);
  dungeons= createFont ("Dungeons.ttf", 10);
  text1= createFont ("DinoTopia.ttf", 50);
  text2= createFont ("DinoTopia.ttf", 30);
  text3= createFont ("Arcane Nine.otf", 30);
  text5= createFont ("Arcane Nine.otf", 15);
  //Alignments
  textAlign (CENTER, CENTER);
  rectMode (CENTER);
  imageMode (CENTER);

  //Load GIF/Image

  introsGIF= new AnimatedGIF (104, "frame_", "_delay-0.1s.gif"); //used this
  iGIF= new AnimatedGIF (26, "frames_", "_delay-0.1s.gif");
  gameGIF= new AnimatedGIF (71, "framess_", "_delay-0.1s.gif"); 
  manUp= new AnimatedGIF (4, 10, "man/up/sprite_", ".png");
  manDown= new AnimatedGIF (4, 10, "man/down/sprite_", ".png");
  manLeft= new AnimatedGIF (4, 10, "man/left/sprite_", ".png");
  manRight= new AnimatedGIF (4, 10, "man/right/sprite_", ".png");
  map= loadImage ("map.png"); //map
  badboss= loadImage ("badboss.png"); //image tba
  i= loadImage ( "dec.jpg"); 

  // extra button codes (ignore for now)
  introButton  = new Button("START", 375, 400, 300, 125, espresso, white);
  greenButton= new Button(".", 730, 50, 50, 50, aqua, blue);
  whiteButton= new Button(".", 730, 510, 50, 50, lemon, aqua);
  quitButton= new Button(".", 50, 510, 50, 50, aqua, lemon);
  pauseButton= new Button(".", 110, 200, 50, 50, aqua, blue);
  pauseButton1= new Button(".", 110, 310, 50, 50, aqua, blue);
  pauseButton2= new Button(".", 110, 420, 50, 50, aqua, blue);
  restartButton= new Button ("", 375, 100, 300, 100, blue, aqua);
  //create objects
  myObjects= new ArrayList <GameObject> (1000);
  myHero = new Hero ();
  myObjects.add (myHero);



  // Boss Enemy 
  myObjects.add (new copyenemy (2, 8));


  //darkness
  darkness= new ArrayList <DarknessCell>(5000);
  while ( y< height) {
    darkness.add (new DarknessCell (x, y, asize+10));
    x+=asize;
    if (x > width) {
      x=0;
      y+=asize;
    }
  }

  x=0;
  y=0;
  while (y < map.height) {
    color roomColor=  map.get (x, y);
    if (roomColor == g) {
      myObjects.add (new  Follower  (x, y));
    }

    if (roomColor == b) {
      myObjects.add (new Lurker (x, y));
      myObjects.add (new Lurker (100, 200));
    }

    x++;
    if ( x== map.width) {
      x=0;
      y++;
    }
  }
} /////////////////////////////////////end of void setup

void draw() {



  click ();

  if (myHero.hitpoint <= 0) { 
    mode= GAMEOVER;
  }

  if (myHero.hpMax >= 220 && myHero.hitpoint >= 120) { 
    mode= WIN;
  }
  if (mode == INTRO) {
    intro ();
  } else if ( mode == GAME) {
    game ();
  } else if ( mode== PAUSE) {
    pause ();
  } else if ( mode== GAMEOVER) {
    gameover ();
  } else if ( mode== WIN) {
    win ();
  } else {
    println ("Error: Mode= " + mode);
  }
  println (mouseX, mouseY);
} /////////////////////////////////////end of void draw



void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
} /////////////////////////////////////end of void click
