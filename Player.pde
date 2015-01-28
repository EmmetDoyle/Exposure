class Player extends GameObject
{
  float radius;
  float gunX, gunY, gunSizeX, gunSizeY;
  
  Player(float x, float y, float theta)
  {
    position.x = x;
    position.y = y;
    colour = color(0, 127, 255);
    radius = 80;
    gunSizeX = 70;
    gunSizeY = 10;
    gunX = radius - 2;
    gunY = position.y - (gunSizeY / 2);
    this.theta = theta;
  }
  
  void move()
  {
    if(keyPressed)
    {
      if(key == 'w')
      {
        theta -= 0.1f;
      }
      else if(key == 's')
      {
        theta += 0.1f;
      }
    }
  }
  
  void display()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    
    stroke(colour);
    strokeWeight(1);
    noFill();
    ellipse(0, 0, radius * 2, radius * 2);
    rect(gunX, 0 - (gunSizeY / 2), gunSizeX, gunSizeY);
    
    popMatrix();
  }
}
