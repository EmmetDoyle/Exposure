class GameObject
{
  PVector position;
  PVector forward;
  color colour;
  float theta;
  boolean alive;
  
  GameObject()
  {
    position = new PVector(width / 2, height / 2);
    forward = new PVector(0, -1);
    alive = true;
  }
  
  void display()
  {
  }
  
  void move()
  {
  }
  
}
