PImage umaru;
PImage cola;
Snowflake[] snow;
void setup()
{

  frameRate(30);
  size(440, 440);
  snow = new Snowflake[100];
  for (int i = 0; i < snow.length; i++)
  {
    snow[i] = new Snowflake();
  }
  cola = loadImage("cola.png");
  umaru = loadImage("http://biginjap.com/59850-thickbox_default/himouto-umaru-chan-roughly-life-size-cushion.jpg");
  // image(umaru, -80, -60, 600, 600);
  background(0);
}
void draw()
{
  
  // image(cola, 100,100,100,150);
  for (int i = 0; i < snow.length; i++)
  {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();    
    snow[i].show();
    snow[i].wrap();
  }
}
void mouseDragged()
{
  // noStroke();
  fill(0);
  ellipse(mouseX, mouseY, 10,10);
}





class Snowflake
{
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*380) + 10;
    y = (int)(Math.random()*380) + 10;
  }
  void show()
  {
    fill(255);
    noStroke();
    ellipse(x, y, 10, 10);
  }
  void lookDown()
  {
    if (y > 0 && y < 440 && get(x, y + 3) == 255)
      isMoving = false;
    else 
      isMoving = true;
  }
  void erase()
  {
    fill(255);
    ellipse(x, y, 10, 10);
  }
  void move()
  {
    if (isMoving == true)
      y += 1;
  }
  void wrap()
  {
    if (y > 440)
    {
      y = 0;
    }
  }
}
