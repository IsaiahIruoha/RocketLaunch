class Clicked {

  float x, y, w, h;

  Clicked (float x1, float y1, float w1, float h1) { //parameters for clicked class
    this.x = x1;
    this.y = y1;
    this.w = w1;
    this.h = h1;
  }

  boolean clicking () { //if the mouse hovers over the button then return boolean value
    return mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.h;
  }
}
