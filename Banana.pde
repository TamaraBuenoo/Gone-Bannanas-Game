class Banana {
  float xpos;
  float ypos;
  float speed;
  PImage banana;
  
  Banana(float newXpos, float newYpos) {
    xpos = newXpos;
    ypos = newYpos;
    speed = 10;
    banana = loadImage("banana.png");
  }
  
  void display(Player player) {
    if (ypos > 0) {
      image(banana, xpos, ypos, 25, 25);
    }
    else {
      xpos = player.xpos;
      ypos = player.ypos;
    }
  }
  
  void move() {
     ypos = ypos - speed;
  }
  
  void shoot(Banana banana, Player player) {
    banana.display(player);
    banana.move();
  }
  
}
