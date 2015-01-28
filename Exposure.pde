ArrayList<GameObject> objects = new ArrayList<GameObject>();

void setup()
{
  size(800, 600);
  objects.add(new Player());
}

void draw()
{
  background(0);
  objects.get(0).display();
}
