class Bullet extends GameObject
{
  float toLive = 5.0f;
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  int number;
  
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
    
    for(int i = 0; i < block.size(); i++)
    {
      if(dist(position.x, position.y, (block.get(i).x + (block.get(i).size / 2)), (block.get(i).y + (block.get(i).size / 2))) < dist(block.get(i).x, block.get(i).y, (block.get(i).x + (block.get(i).size / 2)), (block.get(i).y + (block.get(i).size / 2))))
      {
        block.remove(i);
        alive = false;
        //break;
      }
    }
    
    float speed = 10.0f;
 
    //PVector velocity = PVector.mult(forward, speed);
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
