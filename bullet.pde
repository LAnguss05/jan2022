class Bullet extends GameObject { // ( with float / boolean)

  float d;
  color colors;
  int damage;
  int timer;

  Bullet (PVector shoot, color c, float size, int damages) {
    vel = shoot.copy ();
    lives=1;
    timer=60;
    //shoot=shootV;
    damage=damages;


    loc= myHero.loc.copy ();
    //shoot.add (shoot);
    colors=c;
    d= size;

    roomX=  myHero.roomX;
    roomY= myHero.roomY;
  }

  void show () {
    fill (colors);
    circle (loc.x, loc.y, d);
  }

  void act () {

    loc.add (vel);  //this is taken from pvector, but changed loc.x or y= width or height with hitpoint
    if (loc.x <= width*0.1 )  hitpoint=0;
    if (loc.x >= width*0.9)   hitpoint=0;
    if (loc.y <= height*0.1)  hitpoint=0;
    if (loc.y >= height*0.9)  hitpoint=0;

    if (timer == 0) {
      lives=0;
    }
  }
}
