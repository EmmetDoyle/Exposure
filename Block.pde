class Block
{
  float x, y;
  float size;
  float speed;
  color colour;
  
  Block()
  {
    x = (int)random((width / 2) - (width / 16), (width / 2) + (width / 16));
    y = height;
    colour = color(0);
    size = 10;
    speed =(int)random(1, 7);
  }
  
  void move()
  {
    if(y < 0)
    {
      y = height;
    }
    else
    {
      y = y - speed;
    }
  }
  
  void display()
  {
    strokeWeight(1);
    stroke(colour);
    fill(colour);
    rect(x, y, size, size);
  }
}
