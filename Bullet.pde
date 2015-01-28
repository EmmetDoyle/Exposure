class Bullet extends GameObject
{
  float toLive = 5.0f;
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  int number;
  float y;
  boolean hit0, hit1, hit2, hit3, hit4, hit5;
  
  Bullet(int number)
  {
    if(number == 1)
    {
      colour = color(0, 127, 255);
    }
    else if(number == 2)
    {
      colour = color(255, 127, 0);
    }
    this.number = number;
    y = 5;
    hit0 = false;
    hit1 = false;
    hit2 = false;
    hit3 = false;
    hit4 = false;
    hit5 = false;
  }
  
  void move()
  {
    if(position.x < 0 || position.x > width)
    {
       alive = false;
    }
    if(position.y < 0 || position.y > height)
    {
      alive = false;
    }
    if(number == 1)
    {
      forward.x = sin(theta + (PI/2));
      forward.y = -cos(theta + (PI/2));
    }
    else if(number == 2)
    {
      forward.x = sin(theta + 3*(PI/2));
      forward.y = -cos(theta + 3*(PI/2));
    }
    
    if(number == 1)
    {
      if (dist(position.x, position.y, objects.get(1).position.x, objects.get(1).position.y) < 80)
      {
        alive = false;
        objects.get(1).alive = false;
        gameMode = 2;
      }
      
      if(sheild.get(3).hit == false)
      {
        if (dist(position.x, position.y, objects.get(1).position.x, objects.get(1).position.y) < sheild.get(3).radius)
        {
          alive = false;
          sheild.get(3).hit = true;
        }
      }
      if(sheild.get(4).hit == false)
      {
        if (dist(position.x, position.y, objects.get(1).position.x, objects.get(1).position.y) < sheild.get(4).radius)
        {
          alive = false;
          sheild.get(4).hit = true;
        }
      }
      if(sheild.get(5).hit == false)
      {
        if (dist(position.x, position.y, objects.get(1).position.x, objects.get(1).position.y) < sheild.get(5).radius)
        {
          alive = false;
          sheild.get(5).hit = true;
        }
      }
    }
    
    else if(number == 2)
    {
      if (dist(position.x, position.y, objects.get(0).position.x, objects.get(0).position.y) < 80)
      {
        alive = false;
        objects.get(0).alive = false;
        gameMode = 3;
      }
      
      if(sheild.get(0).hit == false)
      {
        if (dist(position.x, position.y, objects.get(0).position.x, objects.get(0).position.y) < sheild.get(0).radius)
        {
          alive = false;
          sheild.get(0).hit = true;
        }
      }
      if(sheild.get(1).hit == false)
      {
        if (dist(position.x, position.y, objects.get(0).position.x, objects.get(0).position.y) < sheild.get(1).radius)
        {
          alive = false;
          sheild.get(1).hit = true;
        }
      }
      if(sheild.get(2).hit == false)
      {
        if (dist(position.x, position.y, objects.get(0).position.x, objects.get(0).position.y) < sheild.get(2).radius)
        {
          alive = false;
          sheild.get(2).hit = true;
        }
      }
    }
    
    for(int i = 0; i < block.size(); i++)
    {
      if(dist(position.x, position.y, (block.get(i).x + (block.get(i).size / 2)), (block.get(i).y + (block.get(i).size / 2))) < dist(block.get(i).x, block.get(i).y, (block.get(i).x + (block.get(i).size / 2)), (block.get(i).y + (block.get(i).size / 2))))
      {
        block.remove(i);
        alive = false;
        //break;
      }
    }
    
    if(sheild.get(0).hit)
    {
      sheild.get(0).position.y = 1000;
    }
    if(sheild.get(1).hit)
    {
      sheild.get(1).position.y = 1000;
    }
    if(sheild.get(2).hit)
    {
      sheild.get(2).position.y = 1000;
    }
    if(sheild.get(3).hit)
    {
      sheild.get(3).position.y = 1000;
    }
    if(sheild.get(4).hit)
    {
      sheild.get(4).position.y = 1000;
    }
    if(sheild.get(5).hit)
    {
      sheild.get(5).position.y = 1000;
    }
    
    float speed = 10.0f;
 
    //PVector velocity = PVector.mult(forward, speed);
    position.add(forward);
    position.add(forward);
    position.add(forward);
  }
  
  void display()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta + (PI/2));
    
    strokeWeight(1);
    stroke(colour);
    fill(colour);
    line(0, - 5, 0, 5);
    
    popMatrix();
  }
}
