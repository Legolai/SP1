
class DiceCup {
  ArrayList<Die> dice;

  DiceCup() {
    dice = new ArrayList<Die>();
  }

  void addDice(Die die) {
    dice.add(die);
  }

  void shake() {
    dice.forEach((die) -> die.roll());
  }

  void draw(int x, int y, int size) {
    int padding = size + size/2;
    int row = 0;
    int column = 0;
    for (Die die : dice) {
      if(x + padding*column >= width){column = 0; row++;}
      die.draw(x + padding*column, y+padding*row, size);
      column++;
    }
  }

  void drawNumByLine(int x, int y, int size) {
    int padding = size + size/2;

    // Laver 2D Die array kaldet table
    Die[][] table = new Die[dice.size()][dice.size()];

    /*
      Gennem går hver die i dice og lægger den i den første ledige plads
     i den række i table der passer til nummet på terningen.
     */
    for (Die die : dice) {
      int pos = die.getValue()-1;
      for (int i = 0; i < table[pos].length; i++) {
        if (table[pos][i] == null) {
          table[pos][i] = die;
          break;
        }
      }
    }


    // Gennem går hver række i table
    int emptyRows = 0;
    for (int i = 0; i < table.length; i++) {
      // Skipper rækken hvis den er tom og decrementer emptyRows
      if (table[i][0] == null) {
        emptyRows--;
        continue;
      }
      int column = 0;
      // Tegner hver terningen i rækker og breaker når den sidst er tegnet
      for (int j = 0; j < table[i].length; j++) {
        if (table[i][j] == null) {break;}
        if(x+padding*column >= width ){emptyRows++; column=0;}
        table[i][j].draw(x+padding*column, y+padding*(i + emptyRows), size);
        column++;
      }
    }
  }
  
  void drawNumByLineSorted(int x, int y, int size) {
    int padding = size + size/2;
    sort();
    int currentNum = 0;
    int nextLine = -1;
    int column = 0;
    for (Die die : dice) {
      if(die.getValue() != currentNum || x+padding*column >= width ){nextLine++; column = 0;}
      if (die.getValue() != currentNum) {currentNum = die.getValue();} 
      die.draw(x+padding*column, y+padding*nextLine, size);
      column++;
    }
  }

  void sort() {
    dice.sort((a,b) -> Integer.compare(a.getValue(),b.getValue()));
  }

  String toString() {
    String result = "[ ";
    for (Die die : dice) {
      result += die.getValue() + " ";
    }
    return result + "]";
  }
}
