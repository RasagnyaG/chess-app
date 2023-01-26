import "package:chess_app/services/tttlogic.dart";
import 'package:flutter/material.dart';

class TTT extends StatefulWidget {
  const TTT({super.key});

  @override
  State<TTT> createState() => _TTTState();
}

class _TTTState extends State<TTT> {
  String lastTurn = "X";
  bool gameOver = false;
  String result = "";
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  Game game = Game();
  int turn = 0;
  @override
  void initState() {
    super.initState();
    game.board = Game.gameBoardGenerate();
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width / 1.3;
    return Column(
      children: [
        SizedBox(
          width: boardWidth,
          height: boardWidth,
          child: GridView.count(
            crossAxisCount: Game.boxCount ~/
                3, // the ~/ operator allows you to evide to integer and return an Int as a result
            padding: const EdgeInsets.all(16.0),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: List.generate(Game.boxCount, (index) {
              return InkWell(
                onTap: gameOver
                    ? null
                    : () {
                        if (game.board![index] == "") {
                          setState(() {
                            game.board![index] = lastTurn;
                            turn++;
                            gameOver = game.winnerCheck(
                                lastTurn, index, scoreboard, 3);

                            if (gameOver) {
                              result = "$lastTurn is the Winner";
                            } else if (!gameOver && turn == 9) {
                              result = "It's a Draw!";
                              gameOver = true;
                            }
                            if (lastTurn == "X") {
                              lastTurn = "O";
                            } else {
                              lastTurn = "X";
                            }
                          });
                        }
                      },
                child: Container(
                  width: Game.blocSize,
                  height: Game.blocSize,
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Center(
                      child: game.board![index] == ""
                          ? null
                          : Image.asset((game.board![index] == "X")
                              ? "assets/pawn_black.png"
                              : "assets/pawn_white.png")),
                ),
              );
            }),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
            width: 80,
            height: 30,
            child: Row(children: [
              Container(child: result == "" ? null : const Text('Winner is ')),
              Container(
                  child: result == ""
                      ? null
                      : Image.asset((result == "X")
                          ? "assets/pawn_white.png"
                          : "assets/pawn_black.png")),
            ])),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              //erase the board
              game.board = Game.gameBoardGenerate();
              lastTurn = "X";
              gameOver = false;
              turn = 0;
              result = "";
              scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
            });
          },
          icon: const Icon(Icons.replay),
          label: const Text("Repeat the Game"),
        ),
      ],
    );
  }
}
