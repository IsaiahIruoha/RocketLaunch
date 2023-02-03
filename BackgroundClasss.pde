class Background extends Falling {

  Background () { //particles are spawned randomly
    super();
    this.x = floor(random(width));
    this.y = floor(random(height));
    this.sy = 1 + floor(random(9));
  }

  void sketch () { //if the particles hit the bottom of the screen they reset to the top 
    fill(150);
    ellipse(this.x, this.y, this.sy, this.sy);
    if (this.y > height) {
      this.x = floor(random(width));
      this.y =  - 480 + floor(random(height));
      this.sy = 1 + floor(random(9));
    }
  }
}
