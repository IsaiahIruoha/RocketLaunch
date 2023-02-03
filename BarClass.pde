class Bar extends Clicked {

  Bar(float x1, float y1, float w1, float h1) { //the bar the launches the ship is created based on provided parameters
    super(x1, y1, w1, h1);
    this.x = x1;
    this.y = y1;
    this.w = w1;
    this.h = h1;
  }

  void sketch () { //bar is drawn
    strokeWeight(6);
    stroke(0);
    fill(160);
    rect(this.x, this.y, this.w, this.h, 20);
  }
}
