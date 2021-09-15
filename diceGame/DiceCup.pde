class DiceCup {
  ArrayList<Die> dice;

  DiceCup() {
    dice = new ArrayList<Die>();
  }

  void addDice(color dieColor, color eyesColor) {
    dice.add(new Die(dieColor, eyesColor));
  }

  void shake() {
    for (Die element : dice) {
      element.roll();
    }
  }

  void draw(int x, int y, int size) {
    int padding = size+size/2;
    for (int i = 0; i < dice.size(); i++) {
      dice.get(i).draw(x+padding*i, y, size);
    }
  }

  void drawNumByLine(int x, int y, int size) {
    int padding = size + size/2;

    Die[][] table = new Die[dice.size()][dice.size()];
    
    for (Die die : dice) {
      int pos = die.getValue()-1;
      for (int i = 0; i < table[pos].length; i++) {
        if (table[pos][i] == null) {
          table[pos][i] = die;
          break;
        }
      }
    }
    int minus = 0;
    for (int i = 0; i < table.length; i++) {
      if (table[i][0] == null) {
        minus--;
        continue;
      }
      for (int j = 0; j < table[i].length; j++) {
        if(table[i][j] == null){break;}
        table[i][j].draw(x+padding*j, y+padding*(i + minus), size);
      }
    }
  }
}
