import 'package:chess_app/services/piece.dart';
import 'package:chess_app/services/tile.dart';

class Knight extends Piece {
  Knight(int x, int y, String type, String image) : super(x, y, type, image);

  List<List<Tile>> possibleMoves(List<List<Tile>> gameState) {
    List<List<int>> straightSteps = [
      [1, 0],
      [0, 1],
      [-1, 0],
      [0, -1]
    ];
    List<List<int>> gaySteps = [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ];

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        List<int> straightStep = straightSteps[i];
        List<int> gayStep = gaySteps[j];
        int newX = x + straightStep[1] + gayStep[1];
        int newY = y + straightStep[0] + gayStep[0];

        Tile newPosition = gameState[newY][newX];

        if (newPosition.distance(newY, newX) < 3) {
          continue;
        }
        newPosition.makeChosen(this);
      }
    }
    return gameState;
  }
}
