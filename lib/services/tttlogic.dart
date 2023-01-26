class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static const boxCount = 9;
  static const blocSize = 10.0;

  List<String>? board;

  static List<String>? gameBoardGenerate() =>
      List.generate(boxCount, (index) => Player.empty);

  bool winnerCheck(
      String player, int index, List<List<String>> scoreboard, int gridSize) {
    int row = index ~/ 3;
    int col = index % 3;
    scoreboard[row][col] = player;

    if (scoreboard[row][0] == scoreboard[row][1] &&
        scoreboard[row][1] == scoreboard[row][2]) {
      return true;
    }
    if (scoreboard[0][col] == scoreboard[1][col] &&
        scoreboard[1][col] == scoreboard[2][col]) {
      return true;
    }
    if (row == col) {
      if (scoreboard[1][1] == scoreboard[2][2] &&
          scoreboard[0][0] == scoreboard[2][2]) {
        return true;
      }
    }

    return false;
  }
}
