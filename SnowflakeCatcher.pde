//PImage umaru;
//PImage cola;

int f = 30;
int ellipseColor = 127;
Snowflake[] snow;
void setup()
{
  frameRate(f);
  size(440, 440);
  snow = new Snowflake[100];
  for (int i = 0; i < snow.length; i++)
  {
    snow[i] = new Snowflake();
  }
  //cola = loadImage("cola.png");
  //umaru = loadImage("http://biginjap.com/59850-thickbox_default/himouto-umaru-chan-roughly-life-size-cushion.jpg");
  background(0);
}
void draw()
{
  // image(umaru, -80, -60, 600, 600);
  // background(255);
  fill(255);
  noStroke();
//  rect(0, 0, 500, 40);
  
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

  fill(ellipseColor);
  noStroke();
  ellipse(mouseX, mouseY, 10,10);
}
void keyPressed()
{
  if(key == ' '){
    background(0);
  }
    
    if(key == 'p')
      f += 5;
    if (key == 'o')
      f -= 5;
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
    stroke(0);
    fill(255);
    ellipse(x,y, 10,10);
    //image(cola,x, y, 18, 32);
  }
  void lookDown()
  {
    if (y > 0 && y < 440 && get(x, y + 7) == color(127) || get(x + 6, y + 7) == color(127) || get(x - 6, y + 7) == color(127))
      isMoving = false;
    else
      isMoving = true;
  }
  void erase()
  {
    fill(0);
//    noStroke();
    ellipse(x,y,11,11);
  }
  void move()
  {
    if (isMoving == true)
      y += 1;    
  }
  void wrap()
  {
    if (y > 450)
    {
      y = 0;
    }
  }
}
