class Die {
  color dieColor;
  color eyesColor;
  int value;

  Die(color dieColor, color eyesColor) {
    this.dieColor = dieColor;
    this.eyesColor = eyesColor;
    roll();
  }

  void roll() {
    value = (int) random(1, 7);
  }

  int getValue() {
    return value;
  }

  void draw(int x, int y, int size) {
    rectMode(CENTER);
    stroke(0);
    fill(dieColor);
    rect(x, y, size, size);
    fill(eyesColor);
    stroke(eyesColor);
    drawEyes(x, y, size);
  }
  
  void drawEyes(int x, int y, int size){
    float offset = size/3;
    size = size/5;
    if(value % 2 != 0){
      circle(x, y, size);
    }
    if(value != 1){
      circle(x-offset, y-offset, size);
      circle(x+offset, y+offset, size);
    }
    if(value > 3){
      circle(x-offset, y+offset, size);
      circle(x+offset, y-offset, size);
    }
    if(value == 6){
      circle(x-offset, y, size);
      circle(x+offset, y, size);
    }
  }
}
