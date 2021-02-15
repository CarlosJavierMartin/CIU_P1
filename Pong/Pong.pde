import processing.sound.*;

Player p1;
Player p2;
Ball ball;
final int PLAYER_WIDTH = 5;
final int PLAYER_HEIGHT = 50;
final int BALL_DIAMETER = 20; 

SoundFile sound;

void setup(){
  size(400, 400);
  
  p1 = new Player(50, height/2 - 50, PLAYER_WIDTH, PLAYER_HEIGHT);
  p2 = new Player(width - 50, height/2 - 50, PLAYER_WIDTH, PLAYER_HEIGHT);
  ball = new Ball(BALL_DIAMETER);

  sound = new SoundFile(this, "./sound/Alesis-Fusion-Acoustic-Bass-C2.wav");
}

void draw(){  
  background(0);
  stroke(255);
  line(width/2, 0, width/2, 400);
  ball.display();
  
  p1.display();
  p2.display();
  
  text(String.valueOf(p1.getPoints()), width/2 - 30, 20);
  text(String.valueOf(p2.getPoints()), width/2 + 30, 20);
  
  ball.move();
  
  if(ball.getX() >= 400 + ball.getDiameter()){//si la pelota pasa por la derecha del jugador p2, p1 puntúa y la pelota se lanza desde el centro
    p1.score();
    ball.restart();
    
    if(p1.getPoints() == 10){
      end("Player 1 wins!!!!");
    }
  }else if(ball.getX() <= 0 - ball.getDiameter()){//si la pelota pasa por la izquierda del jugador p1, p2 puntúa la pelota se lanza desde el centro
    p2.score();
    ball.restart();
    
    if(p2.getPoints() == 10){
      end("Player 2 wins!!!!");
    }
  }else if(ball.getY() >= 400 - ball.getDiameter()/2 || ball.getY() <= ball.getDiameter()/2){ //si la pelota toca el borde superior o inferior cambia la dirección en el eje y
    ball.changeYDirection();
    
    if(ball.getYMovement() != 0){
      thread("playSound");
    }
  }else if(ball.getXMovement() < 0){
    checkPlayerCollision(p1);
  }else if(ball.getXMovement() > 0){
    checkPlayerCollision(p2);
  }
 
}

//método que se usa para detectar si la pelota choca con algún jugador y cambiar el sentido en el eje x
void checkPlayerCollision(Player p){
  if(p.getY() <= ball.getY() + ball.getDiameter()/2
     && ball.getY() - ball.getDiameter()/2 <= p.getY() + p.getHeight()
     && p.getX() <= ball.getX() + ball.getDiameter()/2
     && ball.getX() - ball.getDiameter()/2 <= p.getX() + p.getWidth()){
    ball.changeXDirection();
    
    //si la pelota no se está moviendo en el eje pero toca algún jugador
    //esta vuelve a tener movimiento en ese eje
    if(ball.getYMovement() == 0){
      ball.resetYMovement();
    }
   
   thread("playSound");
  }
}

void end(String msg){
  noLoop();
  
  background(0);
  text(msg, width/2 - 50, height/2);
  text("Press \"r\" to play again", width/2 - 65, height/2 + 40);
}

void keyPressed(){
  if(key == 'w' && p1.getY() >= p1.getSpeed()){
    p1.move(true);
  }
  
  if(key == 's' && p1.getY() + p1.getHeight() <= height - p1.getSpeed()){
    p1.move(false);
  }
  
  if(keyCode == UP && p2.getY() >= p2.getSpeed()){
    p2.move(true);
  }
  
  if(keyCode == DOWN && p2.getY() + p1.getHeight() <= height - p2.SPEED){
    p2.move(false);
  }
  
  if(key == 'r' && (p1.getPoints() == 10 || p2.getPoints() == 10)){
    loop();
    
    p1.reset();
    p2.reset();
  }
}

void playSound(){
  sound.play(1, 0.25);
}
