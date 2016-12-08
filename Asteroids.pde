class Asteroid extends Floater
{
  protected int rotationSpeed;
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
  public int getRotationSpeed() {return rotationSpeed;}

  public void move()
  {
    super.rotate(rotationSpeed);
    super.move();
  }
}

class BabyAsteroid extends Asteroid
{
  public BabyAsteroid(Asteroid destroyed, int directionX, int directionY)
  {
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 12;
    yCorners[0] = 0;
    xCorners[1] = 8;
    yCorners[1] = -2;
    xCorners[2] = 8;
    yCorners[2] = -10;
    xCorners[3] = 1;
    yCorners[3] = -8;
    xCorners[4] = 0;
    yCorners[4] = -11;
    xCorners[5] = -7;
    yCorners[5] = -7;
    xCorners[6] = -11;
    yCorners[6] = 0;
    xCorners[7] = -9;
    yCorners[7] = 7;
    xCorners[8] = -4;
    yCorners[8] = 3;
    xCorners[9] = -4;
    yCorners[9] = 11;
    xCorners[10] = 7;
    yCorners[10] = 11;
    xCorners[11] = 8;
    yCorners[11] = 1;
    myColor = color(150,150,150);
    myCenterX = destroyed.getX();
    myCenterY = destroyed.getY();
    //need to fix direction transfer
    myDirectionX = destroyed.getDirectionX()+.2*directionX;
    myDirectionY = destroyed.getDirectionY()+.2*directionY;
    myPointDirection = destroyed.getPointDirection();
    rotationSpeed = destroyed.getRotationSpeed();
  }
}