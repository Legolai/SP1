DiceCup player;
int size = 40;
void setup(){
  size(400,400);
  player = new DiceCup();
  for(int i = 0; i < 6; i++){
    player.addDice(color(255),color(0));
  }
  player.shake();
  
}

void draw(){
  background(150);
  //player.draw(size,size,size);
  player.drawNumByLine(size,size,size);
}

void keyPressed(){
  if(key == ' '){
    player.shake();
  }
}
 
