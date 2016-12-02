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