class Player extends GameObject
{
  float squareSize;
  float radius;
  float gunX, gunY, gunSizeX, gunSizeY;
  float centY;
  
  Player()
  {
    centY = height/2;
    squareSize = height / 8;
    x = 0;
    y = centY - (squareSize / 2);
    colour = color(0, 127, 255);
    radius = dist(0, centY, squareSize, y);
    gunSizeX = 50;
    gunSizeY = 10;
    gunX = squareSize;
    gunY = centY - (gunSizeY / 2);
  }
  
  void move()
  {
  }
  
  void display()
  {
    stroke(colour);
    noFill();
    rect(x, y, squareSize, squareSize);
    ellipse(0, centY, radius * 2, radius * 2);
    rect(gunX, gunY, gunSizeX, gunSizeY);
  }
}
