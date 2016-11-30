class Bullet extends Floater
{
	double dRadians;
	public Bullet(SpaceShip aShip)
	{
    	myColor = color(200,200,200);
    	myCenterX = aShip.getX();
   		myCenterY = aShip.getY();
    	myDirectionX = 5*Math.cos(dRadians) + aShip.getDirectionX();
    	myDirectionY = 5*Math.sin(dRadians) + aShip.getDirectionY();
    	myPointDirection = aShip.getPointDirection();
    	dRadians = myPointDirection*(Math.PI/180);
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
	public void show()
	{
		fill(myColor);   
    	stroke(myColor);    
    //convert degrees to radians for sin and cos         
		//double dRadians = myPointDirection*(Math.PI/180);                 
		ellipse((float)myCenterX,(float)myCenterY,5,5);
	}
}