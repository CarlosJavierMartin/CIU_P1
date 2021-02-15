class Player{
  private final int pX;
  private int pY;
  private final int pWidth;
  private final int pHeight;
  private int points = 0;
  private final int SPEED = 10;
  
  public Player(int pX, int pY, int pWidth, int pHeight){
    this.pX = pX;
    this.pY = pY;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
  }
  
  public int getX(){
    return pX;
  }
  
  public int getY(){
    return pY;
  }
  
  public int getWidth(){
    return pWidth;
  }
  
  public int getHeight(){
    return pHeight;  
  }
  
  public int getPoints(){
    return points;  
  }
  
  public int getSpeed(){
    return SPEED;
  }
  
  public void move(boolean up){
    pY = up ? pY - SPEED: pY + SPEED; 
  }  
  
  public void score(){
    points++;
  }
  
  public void reset(){
    points = 0;
    pY = height/2 - 50;
  }
  
  public void display(){
    rect(pX, pY, pWidth, pHeight);  
  }

}
