class Piece {
  int x;
  int y;
  final String type;
  
  final String image;

  Piece(this.x, this.y, this.type, this.image);

  int distance(int row, int col) {
    return (row - y).abs() + (col - x).abs();
  }

  void movePiece(int newX, int newY) {
    x = newX;
    y = newY;
  }
}
