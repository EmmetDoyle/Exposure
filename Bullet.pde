class Bullet extends GameObject
{
  float toLive = 5.0f;
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  
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
  }
  
  void move()
  {
    //ellapsed += timeDelta;
    //if (ellapsed > toLive)
    //{
    //  alive = false;
    //}
    forward.x = sin(theta + (PI/2));
    forward.y = -cos(theta + (PI/2));
    
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
