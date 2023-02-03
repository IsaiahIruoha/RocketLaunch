class Mars extends Clicked {

  String text;
  int textSize;

  Mars (float x, float y, float w, float h, int size, String message) { //parameters for the final destination bar
    super(x, y, w, h);
    this.text = message;
    this.textSize = size;
  }

  void sketch () { //draws the final location and provides its movement code
    rect(this.x, this.y, this.w, this.h);
    textSize(this.textSize);
    fill(0);
    text(this.text, this.x + this.w/ 2 - textWidth(this.text)/ 2, this.y + 26);
  }
}
