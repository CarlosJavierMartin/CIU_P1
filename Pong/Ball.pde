class Ball{
  private int bX;
  private int bY;
  private final int bDiameter;
  private int xMovement = 2;
  private int yMovement = 2;
  
  //Después de fijar el diámetro se obiene de manera aleatoria la dirección,  hacia donde la pelota va,
  //de la siguiente manera -1 + 0 * 2 = -1 o, -1 + 1 * 2 = 1, luego dependiendo de la direción se obtiene el punto x
  //y por último de manera aleatoria la pelota aparece en un lugar en y respentando las dimensiones
  public Ball(int bDiameter){
    this.bDiameter = bDiameter;
    this.xMovement = (-1 + int(random(2)) * 2) * this.xMovement; 
    this.bX = xMovement > 0? width/2 + bDiameter/2 : width/2 - bDiameter/2;
    this.bY = int(random(bDiameter/2, height - bDiameter/2));
  }
  
  public int getX(){
    return bX;
  }
  
  public int getY(){
    return bY;
  }
  
  public int getDiameter(){
    return bDiameter;
  }
  
  public int getXMovement(){
    return xMovement;
  }
  
  public int getYMovement(){
    return yMovement;
  }
  
  public void changeXDirection(){
    xMovement = -xMovement;
  }
  
  public void changeYDirection(){
    yMovement = -yMovement;
  }
  
  //método que se usa cuando no hay movimiento en el eje y para volver a darle movimiento en este eje
  public void resetYMovement(){
    yMovement = 2;
  }
  
  public void move(){
    bX += xMovement;
    bY += yMovement;
  }
  
  //método que se usa para ubicar la pelota en una posición aleatoria después de que algún jugador
  //haya logrado marcar un punto 
  public void restart(){
    bX = xMovement > 0? width/2 + bDiameter/2 : width/2 - bDiameter/2;
    bY = int(random(bDiameter/2, height - bDiameter/2));
    yMovement = int(random(-2,2)) * 2;
  }
  
  public void display(){
     ellipse(bX, bY, bDiameter, bDiameter);  
  }
  
}
