class Falling {
  float x;
  float y;
  float sy;

  Falling (float a, float b, float c) { //falling parameters are created
    x = a;
    y =  b;
    sy = c;
  }

  Falling() { //separate falling parameters if random values are to be assigned
    x = 0;
    y = 0;
    sy = 0;
  }

  void render () { //renders the movement for falling items
    this.y = this.y + this.sy;
  }
}
