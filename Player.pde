class Player extends GameObject
{
  float radius;
  float gunX, gunY, gunSizeX, gunSizeY;
  int number;
  
  Player(float x, float y, float theta, int number)
  {
    position.x = x;
    position.y = y;
    radius = 80;
    gunSizeX = 70;
    gunSizeY = 10;
    gunX = radius - 2;
    gunY = position.y - (gunSizeY / 2);
    this.theta = theta;
    this.number = number;
    if(number == 1)
    {
      colour = color(0, 127, 255);
    }
    else if(number == 2)
    {
      colour = color(255, 127, 0);
    }
  }
  
  void move()
  {
    if(keyPressed)
    {
      if(number == 1)
      {
        if(key == 'w')
        {
          theta -= 0.1f;
        }
        if(key == 's')
        {
          theta += 0.1f;
        }
        else if(key == 'c')
        {
          Bullet bullet = new Bullet(1);
          bullet.position = position.get();
          bullet.theta = theta;
          objects.add(bullet);
          //ellapsed = 0.0f;
        }
      }
      else if(number == 2)
      {
        if(key == 'i')
        {
          theta -= 0.1f;
        }
        if(key == 'k')
        {
          theta += 0.1f;
        }
        else if(key == 'n')
        {
          Bullet bullet = new Bullet(2);
          bullet.position = position.get();
          bullet.theta = theta;
          objects.add(bullet);
          //ellapsed = 0.0f;
        }
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
    fill(colour);
    if(number == 1)
    {
      ellipse(0, 0, radius * 2, radius * 2);
      rect(gunX, 0 - (gunSizeY / 2), gunSizeX, gunSizeY);
    }
    else if(number == 2)
    {
      ellipse(0, 0, radius * 2, radius * 2);
      rect(-gunX, 0 - (gunSizeY / 2), -gunSizeX, gunSizeY);
    }
    
    popMatrix();
  }
}
