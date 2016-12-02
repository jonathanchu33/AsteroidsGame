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

  public void accelerate (double dAmount)   
  {  
    double dRadians = myPointDirection*(Math.PI/180);   
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians)); 
    if (dAmount > 0)
    {
      stroke(250,50,20);
      line((float)(myCenterX - 20*Math.cos(dRadians)), (float)(myCenterY - 20*Math.sin(dRadians)), (float)(myCenterX - 35*Math.cos(dRadians)), (float)(myCenterY - 35*Math.sin(dRadians)));
      line((float)(myCenterX - 20*Math.cos(dRadians - 10*Math.PI/180)), (float)(myCenterY - 20*Math.sin(dRadians - 10*Math.PI/180)), (float)(myCenterX - 35*Math.cos(dRadians - 10*Math.PI/180)), (float)(myCenterY - 35*Math.sin(dRadians - 10*Math.PI/180)));
      line((float)(myCenterX - 20*Math.cos(dRadians + 10*Math.PI/180)), (float)(myCenterY - 20*Math.sin(dRadians + 10*Math.PI/180)), (float)(myCenterX - 35*Math.cos(dRadians + 10*Math.PI/180)), (float)(myCenterY - 35*Math.sin(dRadians + 10*Math.PI/180)));
      stroke(myColor);   
    }  
  } 
}