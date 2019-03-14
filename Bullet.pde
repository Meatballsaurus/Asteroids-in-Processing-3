//defines the bullet object(s)
class Bullet
{
  //declares bullet positions, movement speed
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  
  Bullet(float x, float y)
  {
    //initializes bullet positions, movement speed
    xPos = x;
    yPos = y;
    xSpeed = 0.0;
    ySpeed = 0.0;
  }
  
  //display the bullet
  void display()
  {
    ellipse(xPos, yPos, 5, 5);
  }
  
  //move the bullet
  void move()
  {
    xPos += 10.0*xSpeed;
    yPos += 10.0*ySpeed;
  }
  
  //returns true if the bullet goes off the screen
  boolean outOfBounds()
  {
    if(xPos > width || xPos < 0 || yPos > height || yPos < 0)
    {
      return true;
    }
    return false;
  }
}