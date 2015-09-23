PImage umaru;
Snowflake[] snow;
void setup()
{
  size(440, 440);
  background(0);
  umaru = loadImage("http://biginjap.com/59850-thickbox_default/himouto-umaru-chan-roughly-life-size-cushion.jpg");
}
void draw()
{
  // image(umaru,-80,-80,600,600);
  snow = new Snowflake[10];
  for (int i = 0; i < snow.length; i++)
  {
    snow[i] = new Snowflake();  
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();    
    snow[i].show();
    snow[i].wrap();
  }
}
void mouseDragged()
{
}





class Snowflake
{
  int x, y;
  boolean isMoving;
  Snowflake()
  {
  }
  void show()
  {
    ellipse(x, y, 5, 5);
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
    fill(0);
    ellipse(x, y, 7, 7);
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
