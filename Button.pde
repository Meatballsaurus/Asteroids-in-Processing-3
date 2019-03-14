//defines the button object(s)
class Button
{
  //declare the button positions, size, and text
  float xPos;
  float yPos;
  float xSize;
  float ySize;
  String text;
  Button(float x, float y, float xs, float ys, String t)
  {
    //initializes the button positions, size, and text
    xPos = x;
    yPos = y;
    xSize = xs;
    ySize = ys;
    text = t;
    rectMode(CENTER);
    textSize(24);
  }
  
  //display the button
  void display()
  {
    fill(0);
    stroke(255);
    rect(xPos, yPos, xSize, ySize);
    fill(255);
    textAlign(CENTER, CENTER);
    text(text,xPos,yPos);
  }
  
  //returns true if the mouse is on the button
  //when clicked from the mouseClicked() handler in the main class
  boolean isClicked(float x, float y)
  {
    if((x >= xPos - xSize/2 && x<= xPos + xSize/2) &&
        (y >= yPos - ySize/2 && y <= yPos + ySize/2))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}