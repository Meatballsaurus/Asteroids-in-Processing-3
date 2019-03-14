//defines the asteroid object(s)
class Asteroid
{
  //declares asteroid positions, movement speed and image
  float xPos;
  float yPos;
  float xSize;
  float ySize;
  float xSpeed;
  float ySpeed;
  PImage pic;
  
  Asteroid()
  {
    //initializes asteroid positions, movement speed and image
    xPos = random(width);
    yPos = random(height);
    xSize = 50.0;
    ySize = 50.0;
    xSpeed = random(-2.0,2.0);
    ySpeed = random(-2.0,2.0);
    pic = loadImage("asteroid.png");
  }
  
  //display the asteroid
  void display()
  {
    image(pic, xPos, yPos, xSize, ySize);
  }
  
  //move the asteroid based on its speed
  //if it goes off screen it reappears on the other side of the screen
  void move()
  {
    xPos += xSpeed;
    yPos += ySpeed;
    
    if(xPos > width + 5)
    {
     xPos = -5;
    }
    else if(xPos < - 5)
    {
    xPos = width + 5;
    }
    if(yPos > height + 5)
    {
     yPos = - 5;
    }
    else if(yPos < - 5)
    {
    yPos = height + 5;
    }
  }
}