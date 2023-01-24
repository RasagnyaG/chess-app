import 'package:chess_app/services/piece.dart';

class Tile {
  int row;
  int col;
  Piece piece;
  bool isPiecePresent;
  String originalColor;
  Tile(this.isPiecePresent, this.piece, this.row, this.col, this.originalColor);
  setPiece(Piece piece) {
    this.piece = piece;
    isPiecePresent = true;
  }

  makeChosen(Piece piece) {
    if (!isPiecePresent) {
      return true;
    } else if ((piece.type == "Pawn" && piece.x == row) ||
        (isPiecePresent && this.piece.side == piece.side)) {
      return false;
    } else {
      return true;
    }
  }

  updatePiece(Piece piece) {
    piece.x = row;
    piece.y = col;
    // piece.image = piece.row * 90 + 45;
    // piece.image.y = piece.col * 90 + 45;
    // if (isPiecePresent) {
    //   this.piece.image.destroy();
    // }
    isPiecePresent = true;
    this.piece = piece;
  }
}
