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

  //need to fix this
  for (int j = rock.size()-1; j >= 0; j--)
  {
    for (int i = bill.size()-1; i >= 0; i--)
    {
      if (dist(bill.get(i).getX(), bill.get(i).getY(), rock.get(j).getX(), rock.get(j).getY()) < 20)
      {
        bill.remove(i);
        rock.remove(j);
      }  
    }
  }


  for (int i = 0; i < bill.size(); i++)
  {
    bill.get(i).show();
    bill.get(i).move();
  }
  jchu.show();
  jchu.move();
}
public void keyPressed()
{
  if (keyCode == 37)
    jchu.rotate(-10);
  if (keyCode == 38)
    jchu.accelerate(.1);
  if (keyCode == 39)
    jchu.rotate(10);
  if (keyCode == 40)    
    jchu.accelerate(-.1);
  if (key == 'h') //hyperspace
  {
    jchu.setX((int)(Math.random()*600));
    jchu.setY((int)(Math.random()*600));
    jchu.setDirectionX(0);
    jchu.setDirectionY(0);
    jchu.setPointDirection((int)(Math.random()*360));
  } 
  if (keyCode == 32) //spacebar shoot
    bill.add(new Bullet(jchu));
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