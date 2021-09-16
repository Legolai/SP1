DiceCup player;
int dieSize = 100;
int numOfDice = 400;

void setup() {
  size(800, 800);
  dieSize = width/dieSize*3;
  player = new DiceCup();
  for (int i = 0; i < numOfDice; i++) {
    player.addDice(color(random(255),random(255),random(255)), color(random(255),random(255),random(255)));
  }
  // player.shake();
}

void draw() {
  background(150);
  //player.draw(dieSize,dieSize,dieSize);
  //player.drawNumByLine(dieSize,dieSize,dieSize);
  player.drawNumByLineSorted(dieSize, dieSize, dieSize);
}

void keyPressed() {
  if (key == ' ') {
    player.shake();
  }
}
