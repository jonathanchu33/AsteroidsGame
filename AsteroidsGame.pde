SpaceShip jchu = new SpaceShip();
Star [] space = new Star[150];
ArrayList <Asteroid> rock = new ArrayList <Asteroid>();
ArrayList <Bullet> bill = new ArrayList <Bullet>();
public void setup() 
{
  size(600,600);
  for (int i = 0; i < space.length; i++)
    space[i] = new Star();
  for (int i = 0; i < 10; i++) 
    rock.add(i, new Asteroid());
}
public void draw() 
{
  background(0);
  for (int i = 0; i < space.length; i++)
    space[i].show();
  jchu.show();
  jchu.move();
  for (int i = 0; i < rock.size(); i++)
  {
    rock.get(i).show();
    rock.get(i).move();
  }
  for (int j = rock.size()-1; j >= 0; j--)
  {
    if (dist(jchu.getX(), jchu.getY(), rock.get(j).getX(), rock.get(j).getY()) < 27)
      rock.remove(j);
  }
  for (int i = 0; i < bill.size(); i++)
  {
    bill.get(i).show();
    bill.get(i).move();
  }
}
public void keyPressed()
{
  if (keyCode == 37)
    jchu.rotate(-5);
  if (keyCode == 38)
    jchu.accelerate(.05);
  if (keyCode == 39)
    jchu.rotate(5);
  if (keyCode == 40)    
    jchu.accelerate(-.05);
  if (keyCode == 32) //spacebar hyperspace
  {
    jchu.setX((int)(Math.random()*600));
    jchu.setY((int)(Math.random()*600));
    jchu.setDirectionX(0);
    jchu.setDirectionY(0);
    jchu.setPointDirection((int)(Math.random()*360));
  } 
  if (keyCode == 83)
    bill.add(new Bullet(jchu));
}
class SpaceShip extends Floater  
{
  public SpaceShip()
  {
    corners = 7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 12;
    yCorners[0] = 0;
    xCorners[1] = 7;
    yCorners[1] = -4;
    xCorners[2] = -5;
    yCorners[2] = -4;
    xCorners[3] = -8;
    yCorners[3] = -8;
    xCorners[4] = -8;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 4;
    xCorners[6] = 7;
    yCorners[6] = 4;
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    myCenterX = 300;
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}  
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}   
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;} 
}
abstract class Floater
{   
  protected int corners;  //the number of corners 
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians)); 
    line((float)(myCenterX - 20*Math.cos(dRadians)), (float)(myCenterY - 20*Math.sin(dRadians)), (float)(myCenterX - 35*Math.cos(dRadians)), (float)(myCenterY - 35*Math.sin(dRadians)));
    line((float)(myCenterX - 20*Math.cos(dRadians - 10*Math.PI/180)), (float)(myCenterY - 20*Math.sin(dRadians - 10*Math.PI/180)), (float)(myCenterX - 35*Math.cos(dRadians - 10*Math.PI/180)), (float)(myCenterY - 35*Math.sin(dRadians - 10*Math.PI/180)));
    line((float)(myCenterX - 20*Math.cos(dRadians + 10*Math.PI/180)), (float)(myCenterY - 20*Math.sin(dRadians + 10*Math.PI/180)), (float)(myCenterX - 35*Math.cos(dRadians + 10*Math.PI/180)), (float)(myCenterY - 35*Math.sin(dRadians + 10*Math.PI/180)));
  }   
  public void rotate (int nDegreesOfRotation)   
  {
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX > width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY > height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE); 
  }   
} 

class Star
{
  private int myX, myY, mySize, myColor;
  public Star()
  {
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
    mySize = (int)(Math.random()*5);
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  public void show()
  {
    fill(myColor);
    stroke(myColor);
    ellipse(myX,myY,mySize,mySize);
  }
}

class Asteroid extends Floater
{
  private int rotationSpeed;
  public Asteroid()
  {
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 24;
    yCorners[0] = 0;
    xCorners[1] = 16;
    yCorners[1] = -5;
    xCorners[2] = 19;
    yCorners[2] = -20;
    xCorners[3] = 3;
    yCorners[3] = -16;
    xCorners[4] = -1;
    yCorners[4] = -23;
    xCorners[5] = -14;
    yCorners[5] = -14;
    xCorners[6] = -23;
    yCorners[6] = 1;
    xCorners[7] = -19;
    yCorners[7] = 15;
    xCorners[8] = -8;
    yCorners[8] = 7;
    xCorners[9] = -9;
    yCorners[9] = 22;
    xCorners[10] = 14;
    yCorners[10] = 23;
    xCorners[11] = 17;
    yCorners[11] = 2;
    myColor = color(150,150,150);
    myCenterX = (Math.random()*400);
    myCenterY = (Math.random()*400);
    myDirectionX = (Math.random()*6)-3;
    myDirectionY = (Math.random()*6)-3;
    myPointDirection = (Math.random()*360);
    rotationSpeed = (int)(Math.random()*21)-10;
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}  
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}   
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;} 

  public void move()
  {
    super.rotate(rotationSpeed);
    super.move();
  }
}