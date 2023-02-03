class Launch extends Clicked {

  int r;
  int g;
  int b;

  Launch (float x1, float y1, float w1, float h1, int r, int g, int b) { //launch bar parameters
    super(x1, y1, w1, h1);
    this.x = x1;
    this.y = y1;
    this.w = w1;
    this.h = h1;
    this.r = r;
    this.g = g;
    this.b = b;
  }

  void sketch () { //draws the launch bars that must have curved edges
    fill(this.r, this.g, this.b);
    rect(this.x, this.y, this.w, this.h, 12);
  }
  void sketch2() { //draws the launch bars that have straight edges
    fill(this.r, this.g, this.b);
    rect(this.x, this.y, this.w, this.h);
  }
}
