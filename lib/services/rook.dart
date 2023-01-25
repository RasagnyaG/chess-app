import 'package:chess_app/services/piece.dart';
// import 'package:chess_app/utils/constants.dart';

class Rook extends Piece {
  bool hasMoved;

  Rook(super.x, super.y, super.type, super.side, this.hasMoved);

  // List<List<int>> possibleMoves(List<List<Tile>>) {
  //   List<List<int>> moves = [];
  // int n = 1;
  // int newX = x + n;
  // int newY = y + n;
  // while (newX < 8 && newY < 8) {
  //   moves.add([newX, newY]);
  //   n++;
  // }
  //   if (hasMoved) {
  //     if (side == WHITE) {}
  //   }
  //   // return moves;
  // }
}
