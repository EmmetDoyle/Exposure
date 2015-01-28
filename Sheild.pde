class Sheild extends GameObject
{
  float radius;
  float thickness;
  
  Sheild(float radius, float x, float r, float g, float b)
  {
    position.x = x;
    position.y = height / 2;
    this.radius = radius;
    colour = color(r, g, b);
    thickness = 50;
  }
  
  void move()
  {
  }
  
  void display()
  {
    //pushMatrix();
    //translate(position.x, position.y);
    
    stroke(colour);
    strokeWeight(thickness);
    noFill();
    ellipse(position.x, position.y, radius * 2, radius * 2);
    
    //popMatrix();
  }
}
