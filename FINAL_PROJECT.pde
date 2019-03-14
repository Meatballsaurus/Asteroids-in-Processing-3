/*  Sean Tyrrell
    Final Project
    Asteroids Arcade Game recreation
*/


//declare all of the vairiables to be used
Button newGame;
Button continueGame;
Button instructions;
Button credits;
Button back;
PImage menuBackground;
String menu;
Ship s1;
int roundNumber;
int numberOfAsteroids;
int roundNumberAsteroids;
int numberOfLives;
boolean bulletMoving = false;

ArrayList<Asteroid> Asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> Shots = new ArrayList<Bullet>();

//initialize all of the variables
void setup()
{
  //size(1000,1000);
  fullScreen();
  background(0);
  imageMode(CENTER);
  
  s1 = new Ship();
  newGame = new Button(width/2, height/10, 130.0, 45.0, "New Game");
  continueGame = new Button(width/2, height/5, 130.0, 45.0, "Continue");
  instructions = new Button(width/2, 3*height/10, 150.0, 45.0, "Instructions");
  credits = new Button(width/2, 2*height/5, 110.0, 45.0, "Credits");
  back = new Button(width/4, 3*height/4, 80.0, 45.0, "Back");
  
  menuBackground = loadImage("asteroid.gif");
  menu = "MAIN";
  roundNumber = 0;
  numberOfAsteroids = 0;
  roundNumberAsteroids = 3;
  numberOfLives = 50;
}

void draw()
{
  //display te main/pause menu
  if(menu.equals("MAIN"))
  {
    image(menuBackground,width/2,height/2,width,height);
    newGame.display();
    continueGame.display();
    instructions.display();
    credits.display();
  }
  
  //display the game screen, including the round number and player health
  //plays the actual game portion of the program
  else if(menu.equals("PLAY"))
  {
    background(0);
    
    if(numberOfLives == 0)
    {
      menu = "GAME OVER";
    }
    
    if(numberOfAsteroids < 1)
    {
      spawnNewWave(roundNumberAsteroids);
    }
    
    numberOfAsteroids = Asteroids.size();
    
    for(int i = 0; i < Asteroids.size(); i++)
    {
      Asteroid a = Asteroids.get(i);
      a.move();
      a.display();
      if(Shots.size() != 0)
      {
        if(bulletImpact(a))
        {
         Asteroids.remove(a);
        }
      }
      if(shipImpact(a))
      {
        numberOfLives--;
      }
    }
    
    //deletes each bullet that goes off screen
    for(int i = 0; i < Shots.size(); i++)
    {
      if(Shots.get(i).outOfBounds())
      {
        Shots.remove(i);
        i--;
      }
    }
    
    if(bulletMoving && Shots.size() != 0)
    {
      for(int i = 0; i < Shots.size(); i++)
      {
        Shots.get(i).move();
        Shots.get(i).display();
        if(Shots.get(i).xPos > width || Shots.get(i).xPos < 0 ||
            Shots.get(i).yPos > height || Shots.get(i).yPos < 0)
            {
              Shots.remove(i);
              i--;
            }
      }
    }
    
    s1.move();
    s1.display();
    s1.isAccelerating = false;
    
    if(keyPressed)
    {
      if(keyCode == LEFT)
      {
        s1.turn(-5.0);
      }
      else if(keyCode == RIGHT)
      {
        s1.turn(5.0);
      }
      else if(keyCode == UP)
      {
        s1.accelerate();
        s1.isAccelerating = true;
      }
      else if(key == 'p')
      {
        menu = "MAIN";
      }
    }
    
    
    text("Ship Health: " + numberOfLives, 100, 100);
    text("Wave " + roundNumber, 100, 75);
  }
  
  //display the instructions/controls
  else if(menu.equals("INSTRUCTIONS"))
  {
    background(0);
    back.display();
    textAlign(LEFT, CENTER);
    text("Accelerate", width/4, 100);
    text("Turn", width/4, 150);
    text("Shoot", width/4, 200);
    text("Pause", width/4, 250);
    text("Esc", width/4, 300);
    text("UP Arrow Key", 2.5*width/4, 100);
    text("LEFT & RIGHT Arrow Keys", 2.5*width/4, 150);
    text("SPACEBAR", 2.5*width/4, 200);
    text("p", 2.5*width/4, 250);
    text("Close the game", 2.5*width/4, 300);
  }
  
  //display the program's credits
  else if(menu.equals("CREDITS"))
  {
    background(0);
    back.display();
    text("Code Written By", width/2, height/3);
    text("Sean Tyrrell", width/2, height/3 + 30);
    text("Inspired by the original", width/2, height/2);
    text("Classic Asteroids Arcade Game", width/2, height/2 + 30);
    text("Not Intended for Profit", width/2, 2*height/3);
  }
  
  //display the game over screen
  else if(menu.equals("GAME OVER"))
  {
    //background(0);
    textSize(48);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2);
    textSize(24);
    text("You Reached Round " + roundNumber, width/2, 2*height/3);
    newGame.display();
  }
}

//shoots bullets from the ship when the player hits the spacebar
void keyReleased()
{
  if(key == ' ')
  {
    Bullet b = new Bullet(s1.xPos, s1.yPos);
    bulletMoving = true;
    Shots.add(b);
    s1.shoot(b);
  }
}

//detect when any of the menu buttons are clicked
void mouseClicked()
{
  if(newGame.isClicked((float)mouseX, (float)mouseY) && (menu.equals("MAIN") || menu.equals("GAME OVER")))
  {
    menu = "PLAY";
    resetGame();
  }
  else if(continueGame.isClicked((float)mouseX, (float)mouseY) && menu.equals("MAIN"))
  {
    menu = "PLAY";
  }
  else if(instructions.isClicked((float)mouseX, (float)mouseY) && menu.equals("MAIN"))
  {
    menu = "INSTRUCTIONS";
  }
  else if(credits.isClicked((float)mouseX, (float)mouseY) && menu.equals("MAIN"))
  {
    menu = "CREDITS";
  }
  else if(back.isClicked((float)mouseX, (float)mouseY) && (menu.equals("INSTRUCTIONS") || menu.equals("CREDITS")))
  {
    menu = "MAIN";
  }
}

//returns true if any bullets are hitting the asteroid that is passed in as a parameter
boolean bulletImpact(Asteroid a)
{
  for(int i = 0; i < Shots.size(); i++)
  {
    Bullet b = Shots.get(i);
    if(sq(a.xSize/2) > sq(abs(b.xPos - a.xPos))+sq(abs(b.yPos - a.yPos)))
    {
      Shots.remove(i);
      return true;
    }
  }
  
  return false;
}

//returns true if the ship is colliding with any of the asteroids
boolean shipImpact(Asteroid a)
{
  if(sq(a.xSize/2) > sq(abs(s1.xPos - a.xPos))+sq(abs(s1.yPos - a.yPos)))
  {
    return true;
  }
  return false;
}

//spawn a new round of asteroids and increase the round number
void spawnNewWave(int numAsteroids)
{
  for(int i = 0; i < numAsteroids; i++)
  {
    Asteroid a = new Asteroid();
    Asteroids.add(a);
  }
  roundNumberAsteroids *= 1.5;
  roundNumber++;
}

//reset the game when the "new game" button is clicked
void resetGame()
{
  for(int i = Shots.size()-1; i > -1; i--)
  {
    Shots.remove(i);
  }
  for(int i = Asteroids.size() - 1; i > -1; i--)
  {
    Asteroids.remove(i);
  }
  roundNumber = 0;
  numberOfAsteroids =0;
  roundNumberAsteroids = 3;
  numberOfLives = 50;
  bulletMoving = false;
  s1 = new Ship();
}