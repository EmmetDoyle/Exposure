ArrayList<GameObject> objects = new ArrayList<GameObject>();

void setup()
{
  size(800, 600);
  objects.add(new Player(0, (height/2) - 37.5f, 0));
  objects.add(new Player(width, (height/2) - 37.5f, 0));
  objects.add(new Sheild(200, 0, 0, 127, 255));
  objects.add(new Sheild(270, 0, 0, 127, 255));
  objects.add(new Sheild(340, 0, 0, 127, 255));
  objects.add(new Sheild(200, width, 255, 127, 0));
  objects.add(new Sheild(270, width, 255, 127, 0));
  objects.add(new Sheild(340, width, 255, 127, 0));
}

void draw()
{
  background(255);
  for(int i = 0; i < objects.size(); i++)
  {
    objects.get(i).move();
    objects.get(i).display();
  }
}
