class Bouncing extends Clicked {
  float sx;
  float sy;
  PImage i; 

  Bouncing (float x1, float y1, float w1, float h1, PImage a) { //base values for bouncing image alienShip are provided in the declaration
    super(x1, y1, w1, h1);
    this.x = x1;
    this.y = y1;
    this.w = w1;
    this.h = h1;
    this.sx = 3;
    this.sy = 3;
    this.i = a;
    
  }

  void sketch () { // draws the bouncing image and makes it stay within the screensize and sets speeds
    image(this.i, this.x, this.y, this.w, this.h);
    this.x  = this.sx + this.x;
    this.y = this.sy + this.y;
    if (this.x > width - this.w) this.sx *= -1;
    if (this.x < 0) this.sx *= -1;
    if (this.y > height - this.h) this.sy *= -1;
    if (this.y < 0) this.sy *= -1;
  }
}
