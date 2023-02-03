class Asteroid extends Falling {

  Asteroid () { //random spawning for asteroids
    super();
    this.x = floor(random(width));
    this.y = - height + floor(random(height));
    this.sy = 3 + floor(random(4));
  }

  void sketch () { //draws the asteroid and causes them to respawn when hitting the botton of the screen
    fill(255, 0, 0);
    image(astImage, this.x, this.y, this.sy + 30, this.sy + 30);
    if (this.y > height) {
      this.x = floor(random(width));
      this.y =  - 480 + floor(random(height));
      this.sy = 3 + floor(random(4));
    }
  }
}
