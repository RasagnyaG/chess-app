import 'package:chess_app/services/piece.dart';
class Bishop extends Piece {

  Bishop(super.x, super.y, super.type, super.side);

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
}
