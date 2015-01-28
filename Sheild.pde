class Sheild extends GameObject
{
  float radius;
  float thickness;
  int number;
  float y;
  boolean hit;
  
  Sheild(float radius, float x, int number)
  {
    position.x = x;
    position.y = height / 2;
    this.radius = radius;
    this.number = number;
    if(number == 1)
    {
      colour = color(0, 127, 255);
    }
    else if(number == 2)
    {
      colour = color(255, 127, 0);
    }
    thickness = 50;
    y = 0;
    hit = false;
  }
  
  void move()
  {
    if(number == 1)
    {
      if(keyPressed)
      {
        if(key == 'v')
        {
          y = 1000;
          sheildTimer.start();
        }
        else
        {
          y = 0;
        }
      }
    }
    else if(number == 2)
    {
      if(keyPressed)
      {
        if(key == 'b')
        {
          y = 1000;
          sheildTimer.start();
        }
        else
        {
          y = 0;
        }
      }
    }
    if(sheildTimer.isFinished())
    {
      y = 0;
    }
  }
  
  
  
  void display()
  { 
    pushMatrix();
    translate(position.x, position.y);
    
    stroke(colour);
    strokeWeight(thickness);
    noFill();
    ellipse(0, y, radius * 2, radius * 2);
    
    popMatrix();
  }
}
