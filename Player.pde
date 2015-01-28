class Player extends GameObject
{
  float squareSize;
  float radius;
  float gunX, gunY, gunSizeX, gunSizeY;
  float centY;
  
  Player(float x, float y, float theta)
  {
    centY = height/2;
    squareSize = height / 8;
    position.x = x;
    position.y = y;
    colour = color(0, 127, 255);
    radius = dist(0, centY, squareSize, position.y);
    gunSizeX = 50;
    gunSizeY = 10;
    gunX = squareSize;
    gunY = centY - (gunSizeY / 2);
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
    //pushMatrix();
    //translate(position.x, position.y);
    //rotate(theta);
    
    stroke(colour);
    strokeWeight(1);
    noFill();
    rect(position.x, position.y, squareSize, squareSize);
    ellipse(position.x, centY, radius * 2, radius * 2);
    rect(gunX, gunY, gunSizeX, gunSizeY);
    
    //popMatrix();
  }
}
