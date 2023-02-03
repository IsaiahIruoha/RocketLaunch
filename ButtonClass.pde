class Button extends Clicked {

  String text;
  int textSize;

  Button (float x, float y, float w, float h, int size, String message) { //provides the button parameters
    super(x, y, w, h);
    this.text = message;
    this.textSize = size;
  }

  void sketch () { //draws the button and makes use of the click function created in the Clicked super class
    if (this.clicking()) {
      fill(150, 180);
    } else {
      fill(0, 180);
    }
    rect(this.x, this.y, this.w, this.h, 8);
    textSize(this.textSize);
    fill(255);
    text(this.text, this.x + this.w/ 2 - textWidth(this.text)/ 2, this.y + 26);
  }
}
