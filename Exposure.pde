ArrayList<GameObject> objects = new ArrayList<GameObject>();
ArrayList<Block> block = new ArrayList<Block>();
Timer timer;
Timer sheildTimer;
int totalBlocks;

void setup()
{
  size(800, 600);
  objects.add(new Player(0, (height/2), 0, 1));
  objects.add(new Player(width, (height/2), 0, 2));
  objects.add(new Sheild(200, 0, 1));
  objects.add(new Sheild(270, 0, 1));
  objects.add(new Sheild(340, 0, 1));
  objects.add(new Sheild(200, width, 2));
  objects.add(new Sheild(270, width, 2));
  objects.add(new Sheild(340, width, 2));
  totalBlocks = 30;
  block.add(new Block());
  timer = new Timer(250);
  timer.start();
  sheildTimer = new Timer(100);
}

void draw()
{
  background(255);
  for(int i = 0; i < objects.size(); i++)
  {
    objects.get(i).move();
    objects.get(i).display();
    if(objects.get(i).alive == false)
    {
      objects.remove(i);
    }
  }
  for(int i = 0; i < block.size(); i++)
  {
    block.get(i).move();
    block.get(i).display();
  }
  
  if(block.size() < totalBlocks && timer.isFinished())
  {
    block.add(new Block());
    timer.start();
  }
  
  strokeWeight(1);
  stroke(0);
  fill(0);
  //line(0, height / 2, width, height / 2);
}
