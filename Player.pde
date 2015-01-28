class Player extends GameObject
{
  float radius;
  float gunX, gunY, gunSizeX, gunSizeY;
  int number;
  
  char up, down, left, right, start, button1, button2;
  
  Player(float x, float y, float theta)
  {
    position.x = x;
    position.y = y;
    radius = 80;
    gunSizeX = 70;
    gunSizeY = 10;
    gunX = radius - 2;
    gunY = position.y - (gunSizeY / 2);
    this.theta = theta;
  }
  
  Player(int index, char up, char down, char left, char right, char start, char button1, char button2, float x, float y, float theta)
  {
    this(x, y, theta);
    number = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
    
    if(number == 1)
    {
      colour = color(0, 127, 255);
    }
    else if(number == 2)
    {
      colour = color(255, 127, 0);
    }
  }
  
  Player(int index, XML xml, float x, float y, float theta)
  {
    this(index
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        , x
        , y
        , theta
        );
  }
  
  void move()
  {
    if(keyPressed)
    {
      if(number == 1)
      {
        if(checkKey(up))
        {
          theta -= 0.1f;
        }
        if(checkKey(down))
        {
          theta += 0.1f;
        }
        else if(checkKey(button1))
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
        if(checkKey(up))
        {
          theta += 0.1f;
        }
        if(checkKey(down))
        {
          theta -= 0.1f;
        }
        else if(checkKey(button1))
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
