class Stage {
  PImage title;
  PImage gameScreen;
  PImage youWin;
  PImage youLose;
  int y;

  final int MENU=0;
  final int GAME=1; //creates case for level1 (game1)
  final int GAME2=2; //creates case for level 2
  final int GAME3=3; //creates case for level 3
  final int WIN = 4;
  final int LOSE = 5;
  int state = 0;
  boolean inGame1 = false;
  boolean inGame2 = false;
  boolean inGame3 = false;

  Stage() {
    title = loadImage("title screen.png");
    gameScreen = loadImage("jungle background.png");
    youWin = loadImage("you win.png");
    youLose = loadImage("you lose.png");
  }

  boolean down = false;
  boolean up = false;

  void mousePressed() {
    down = true; //click command
  }
  
  void mouseReleased() {
    up = true;
  }

  void switchStage(boolean click) {
    switch (state) {
    case MENU:
    background(title); 
    y++; 
    if (y > height) {
      y = 0;
    }
    
//Button #1
  if (mouseX > 245 && mouseX < 295 && mouseY > 415 && mouseY < 465) {
   //if in square on x and y coordinates
     fill(#AD109F); //color of inside when mouse is on it
     circle(267, 442, 33); 
   }

    if (state == MENU && mouseX > 245 && mouseX < 295 && mouseY > 415 && mouseY < 465 && mousePressed) {
      state=GAME;
    }
    
//Button #2    
   //if ur mouse is over medium, then changes color
    if (mouseX > 365 && mouseX < 415 && mouseY > 415 && mouseY < 465) {
     fill(#5BB31C); //color of inside when mouse is on it
     circle(388, 442, 33);
    }

    if (state == MENU && mouseX > 365 && mouseX < 415 && mouseY > 415 && mouseY < 465 && mousePressed) { 
      state=GAME2;
    }
    
//Button #3     
    if (mouseX > 475 && mouseX < 525 && mouseY > 415 && mouseY < 465) {
      fill(#D1D132);
      circle(498, 442, 33);
    }
    //if clicked then takes u to GAME3
    if (state == MENU && mouseX > 475 && mouseX < 525 && mouseY > 415 && mouseY < 465 && mousePressed) {
      state=GAME3;
    }
   break;
  //case has to be declared
  case GAME:
    background(gameScreen);
    inGame1 = true;
    if (enemy1.hit && enemy2.hit && enemy3.hit && enemy4.hit && enemy5.hit) {
      state = WIN;
    }
    if (enemy1.ypos > 475 || enemy2.ypos > 475 || enemy3.ypos > 475 || enemy4.ypos > 475 || enemy5.ypos > 475) {
      state = LOSE;
    }
    break; 
    
   case GAME2:
    background(gameScreen);
    inGame2 = true;
    if (enemy1.hit && enemy2.hit && enemy3.hit && enemy4.hit && enemy5.hit) {
      state = WIN;
    }
    if (enemy1.ypos > 475 || enemy2.ypos > 475 || enemy3.ypos > 475 || enemy4.ypos > 475 || enemy5.ypos > 475) {
      state = LOSE;
    }
    break; 
    
    case GAME3: //case of game 3
    background(gameScreen);
    inGame3 = true;
    if (enemy1.hit && enemy2.hit && enemy3.hit && enemy4.hit && enemy5.hit) {
      state = WIN;
    }
    if (enemy1.ypos > 475 || enemy2.ypos > 475 || enemy3.ypos > 475 || enemy4.ypos > 475 || enemy5.ypos > 475) {
      state = LOSE;
    }
    break; 
    
    case WIN:
    background(youWin);
    inGame1 = false;
    inGame2 = false;
    inGame3 = false;
    if (mouseX > 370 && mouseX < 420 && mouseY > 410 && mouseY < 460) {
     fill(#AD109F); 
     circle(395, 442, 33); 
   }

    if (mouseX > 370 && mouseX < 420 && mouseY > 410 && mouseY < 460 && click) {
      state=MENU;
    }
    
    break;
    
    case LOSE:
    background(youLose);
    inGame1 = false;
    inGame2 = false;
    inGame3 = false;
    
    //if you select play again button, takes you back to start page
    if (mouseX > 370 && mouseX < 420 && mouseY > 420 && mouseY < 470) {
     fill(#AD109F); 
     circle(395, 451, 33); 
   }

    if (mouseX > 370 && mouseX < 420 && mouseY > 420 && mouseY < 470 && click) {
      state=MENU;
    }
    
    break;
    }
  }
}
