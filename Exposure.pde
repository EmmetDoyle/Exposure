ArrayList<GameObject> objects = new ArrayList<GameObject>();
ArrayList<Sheild> sheild = new ArrayList<Sheild>();
ArrayList<Block> block = new ArrayList<Block>();
Timer timer;
Timer sheildTimer;
int totalBlocks;
int totalSheilds;
int gameMode;
boolean[] keys = new boolean[526];

void setup()
{
  size(800, 600);
  setUpPlayerControllers();
  //objects.add(new Player(0, (height/2), 0, 1));
  //objects.add(new Player(width, (height/2), 0, 2));
  sheild.add(new Sheild(200, 0, 1));
  sheild.add(new Sheild(270, 0, 1));
  sheild.add(new Sheild(340, 0, 1));
  sheild.add(new Sheild(340, width, 2));
  sheild.add(new Sheild(270, width, 2));
  sheild.add(new Sheild(200, width, 2));
  totalBlocks = 30;
  block.add(new Block());
  timer = new Timer(250);
  timer.start();
  sheildTimer = new Timer(100);
  totalSheilds = 7;
  gameMode = 0;
}

void draw()
{
  if(gameMode == 0)
  {
    background(0);
    for(int i = 0; i < sheild.size(); i++)
    {
      sheild.get(i).display();
    }
    if(keyPressed)
    {
      if(key == ' ')
      {
        gameMode = 1;
      }
    }
  }
  
  
  else if(gameMode == 1)
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
    for(int i = 0; i < sheild.size(); i++)
    {
      sheild.get(i).move();
      sheild.get(i).display();
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
  
  else if(gameMode == 2)
  {
    background(0, 127, 255);
  }
  
  else if(gameMode == 3)
  {
    background(255, 127, 0);
  }
    
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    objects.add(new Player(i + 1, playerXML, i * width, (height/2), 0));
  }
}
