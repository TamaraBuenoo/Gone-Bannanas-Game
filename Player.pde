class Player {
  PImage player;
  float xpos;
  float ypos;
  float xchange;
  
  Player() {
    player = loadImage("enemy monkey.png");
    xpos = 350;
    ypos = 525;
  }
  
  //shows the player on the screen
  void display() {
    image(player, xpos, ypos, 75, 75);
  }
  
  void move(float steps) {
    xchange = steps;
  }
  
  //updates the position of the player, constrained to the boundaries of the board size
  void update() {
    xpos += xchange;
    xpos = constrain(xpos, 0, 725);
  }
  
}
