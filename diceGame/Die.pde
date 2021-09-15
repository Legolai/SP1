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
    fill(dieColor);
    rect(x, y, size, size);
    fill(eyesColor);
    drawEyes(x, y, size);
    
  }
  
  void drawEyes(int x, int y, int size){
    float offset = size/3;
    size = size/5;
    switch (value) {
    case 1:
      circle(x, y, size);
      break;
    case 2:
      circle(x-offset, y-offset, size);
      circle(x+offset, y+offset, size);
      break;
    case 3:
      circle(x-offset, y-offset, size);
      circle(x, y, size);
      circle(x+offset, y+offset, size);
      break;
    case 4:
      circle(x-offset, y-offset, size);
      circle(x-offset, y+offset, size);
      circle(x+offset, y+offset, size);
      circle(x+offset, y-offset, size);
      break;
    case 5:
      circle(x-offset, y-offset, size);
      circle(x-offset, y+offset, size);
      circle(x+offset, y+offset, size);
      circle(x+offset, y-offset, size);
      circle(x, y, size);
      break;
    case 6:
      circle(x-offset, y-offset, size);
      circle(x-offset, y, size);
      circle(x-offset, y+offset, size);

      circle(x+offset, y+offset, size);
      circle(x+offset, y, size);
      circle(x+offset, y-offset, size);
      
      break;
    }
    
  }
}
