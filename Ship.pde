//defines the ship object
class Ship
{
  //declare the ship's variables
  float xPos;
  float yPos;
  float turnDirection;
  float xSpeed;
  float ySpeed;
  boolean isAccelerating = false;
  
  Ship()
  {
    //initialize the ship's variables
    xSpeed = 0.0;
    ySpeed = 0.0;
    xPos = width/2.0;
    yPos = height/2.0;
    turnDirection = 0.0;
  }
  
  //display the ship
  void display()
  {
    pushMatrix();
    translate(xPos, yPos);
    rotate(turnDirection);
    if(isAccelerating)
    {
      triangle(0,15,-5,5,5,5);
    }
    triangle(0,-20,-10,10,10,10);
    popMatrix();
  }
  
  //turn the ship
  void turn(float degrees)
  {
    turnDirection += radians(degrees);
  }
  
  //gives the passed bullet a speed and makes it move in the direction the ship is facing
  void shoot(Bullet bill)
  {
    bill.xSpeed = sin(turnDirection);
    bill.ySpeed = -cos(turnDirection);
  }
  
  //accelerates the ship in the direction it's facing, up to a maximum speed
  void accelerate()
  {
    if(xSpeed > 150.0)
    {
      xSpeed = 150.0;
    }
    else if(xSpeed < -150.0)
    {
      xSpeed = -150.0;
    }
    xSpeed += sin(turnDirection);
    
    if(ySpeed > 150.0)
    {
      ySpeed = 150.0;
    }
    else if(ySpeed < -150.0)
    {
      ySpeed = -150.0;
    }
    ySpeed += -cos(turnDirection);
  }
  
  //move the ship
  void move()
  {
    xPos += .05*xSpeed;
    yPos += .05*ySpeed;
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