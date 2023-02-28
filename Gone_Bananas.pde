/*
Names: Tamara Bueno, Cassandra Salazar, Grace Wang
December 17, 2022
Gone Bananas! A space invaders-esque shooting game
*/

//declaring all necessary objects and variables
Enemy enemy1;
Enemy enemy2;
Enemy enemy3;
Enemy enemy4;
Enemy enemy5;
Stage stage;
Player player;
Banana banana;

void setup() {
  size(800, 600);
  
  //initializing each object
  enemy1 = new Enemy(275);
  enemy2 = new Enemy(375);
  enemy3 = new Enemy(475);
  enemy4 = new Enemy(575);
  enemy5 = new Enemy(175);
  stage = new Stage();
  player = new Player();
  banana = new Banana(player.xpos, player.ypos);

}

void draw() {
  
  stage.switchStage(click);
  
  if(stage.inGame1 || stage.inGame2 || stage.inGame3) {
    if(stage.inGame1) {
      enemy1.updateSpeed(.1);
      enemy2.updateSpeed(.1);
      enemy3.updateSpeed(.1);
      enemy4.updateSpeed(.1);
      enemy5.updateSpeed(.1);
    }
    if(stage.inGame2) {
      enemy1.updateSpeed(.5);
      enemy2.updateSpeed(.5);
      enemy3.updateSpeed(.5);
      enemy4.updateSpeed(.5);
      enemy5.updateSpeed(.5);
    }
    if(stage.inGame3) {
      enemy1.updateSpeed(1);
      enemy2.updateSpeed(1);
      enemy3.updateSpeed(1);
      enemy4.updateSpeed(1);
      enemy5.updateSpeed(1);
    }
    if (!enemy1.hit) {
     enemy1.display();
    }
    enemy1.move();
    enemy1.hit(banana);
    
    if (!enemy2.hit) {
     enemy2.display();
    }
    enemy2.move();
    enemy2.hit(banana);
    
    if (!enemy3.hit) {
     enemy3.display();
    }
    enemy3.move();
    enemy3.hit(banana);
    
    if (!enemy4.hit) {
     enemy4.display();
    }
    enemy4.move();
    enemy4.hit(banana);
    
    if (!enemy5.hit) {
     enemy5.display();
    }
    enemy5.move();
    enemy5.hit(banana);
  
  player.display();
  player.update();
  
  banana.shoot(banana, player);
  }
  else {
    resetStage();
  }
}

void keyReleased() {
  
  //when not pressing a key the player stops moving
  player.move(0);

}

void keyPressed() {
  
  //a causes player to move left, d causes player to move right
  if (key == 'a') {
    player.move(-5);
  } else if (key == 'd') {
    player.move(5);
  }
}
 
void resetStage() {
  banana.xpos = -50;
  enemy1.hit = false;
  enemy2.hit = false;
  enemy3.hit = false;
  enemy4.hit = false;
  enemy5.hit = false;
  
  enemy1.ypos = 10;
  enemy2.ypos = 10;
  enemy3.ypos = 10;
  enemy4.ypos = 10;
  enemy5.ypos = 10;
  
  player.xpos = 350;
}

boolean click = false;
void mouseClicked() {
  if (stage.state == 4 || stage.state == 5) {
    click = true;
  }
  else {
    click = false;
  }
}
