import 'package:chess_app/services/piece.dart';

class Tile {
  int x;
  int y;
  bool isPiecePresent;
  Piece piece;
  Tile(this.isPiecePresent, this.piece, this.x, this.y);

  void setPiece(Piece piece) {
    this.piece = piece;
    isPiecePresent = true;
  }

  void removePiece() {
    isPiecePresent = false;
  }

  bool makeChosen(Piece piece) {
    if (!isPiecePresent) {
      return true;
    } else if ((piece.type == "Pawn" && piece.x == x) || (isPiecePresent)) {
      return false;
    } else {
      return true;
    }
  }

  int distance(int x, int y) {
    return (x - this.x).abs() + (y - this.y).abs();
  }

  void updatePiece(Piece piece) {
    piece.x = x;
    piece.y = y;
    // piece.image = piece.x * 90 + 45;
    // piece.image.y = piece.y * 90 + 45;
    // if (isPiecePresent) {
    //   this.piece.image.destroy();
    // }
    isPiecePresent = true;
    this.piece = piece;
  }
}
