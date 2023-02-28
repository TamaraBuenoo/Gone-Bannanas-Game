 class Enemy {
  float xpos;
  float ypos;
  float speed;
  PImage enemy;
  
  boolean hit = false;
  
  Enemy() {
    xpos = 0;
    ypos = 0;
    speed = 0;
    enemy = loadImage("enemy monkey.png");
  }
  
  //constructor that creates an enemy monkey object with a specified starting x position and speed
  Enemy(float newXpos) {
    xpos = newXpos;
    ypos = 10.0;
    speed = 0;
    enemy = loadImage("enemy monkey.png");
  }
  
  //makes the image of the monkey visible
  void display() {
   image(enemy, xpos, ypos, 50, 50);
  }
  
  //code that allows the monkeys to slowly descend down
  void move() {
     ypos = ypos + speed;
     if (ypos > 475) {
       speed = 0;
    }
  }
  
  //changes speed
  void updateSpeed(float newSpeed) {
    if (ypos <= 475) {
      speed = newSpeed;
    }
  }
  
  //check if hit, and if yes, image disappears
  void hit(Banana banana) {
    if (banana.xpos - xpos < 50 && banana.xpos - xpos > -10 && banana.ypos - ypos < 50 && banana.xpos != -50) {
      image(enemy, xpos, ypos, 0, 0);
      hit = true;
    }
  }
}
 
