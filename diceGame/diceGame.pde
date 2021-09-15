DiceCup player;
int dieSize = 40;
int numOfDice = 6;

void setup(){
  size(400,400);
  player = new DiceCup();
  for(int i = 0; i < numOfDice; i++){
    player.addDice(color(255),color(0));
  }
  player.shake();
  
}

void draw(){
  background(150);
  //player.draw(dieSize,dieSize,dieSize);
  player.drawNumByLine(dieSize,dieSize,dieSize);
}

void keyPressed(){
  if(key == ' '){
    player.shake();
  }
}
 
