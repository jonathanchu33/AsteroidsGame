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
    myDirectionX = (Math.random()*4)-2;
    myDirectionY = (Math.random()*4)-2;
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