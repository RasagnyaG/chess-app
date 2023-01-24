class Bishop {
  int x;
  int y;

  Bishop(this.x, this.y);

  List<List<int>> possibleMoves() {
    List<List<int>> moves = [];
    int n = 1;
    int newX = x + n;
    int newY = y + n;
    while (newX < 8 && newY < 8) {
      moves.add([newX, newY]);
      n++;
    }
    return moves;
  }

  void movePiece(int newX, int newY) {
    x = newX;
    y = newY;
  }
}
