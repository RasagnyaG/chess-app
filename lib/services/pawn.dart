import 'package:chess_app/services/piece.dart';
// import 'package:chess_app/utils/constants.dart';

class Pawn extends Piece {
  bool hasMoved;

  Pawn(int x, int y, String type, String image, this.hasMoved)
      : super(x, y, type, image);

  // Pawn(this.x, this.y, this.hasMoved);

  // List<List<int>> possibleMoves() {
  //   List<List<int>> moves = [];
  //   // int n = 1;
  //   // int newX = x + n;
  //   // int newY = y + n;
  //   // while (newX < 8 && newY < 8) {
  //   //   moves.add([newX, newY]);
  //   //   n++;
  //   // }
  //   if (hasMoved) {
  //     if (side == white) {}
  //   }
  //   // return moves;
  // }
}
