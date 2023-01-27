// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';

import '../services/playerState.dart';

class Board extends StatefulWidget {
  const Board({super.key});
  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  ChessBoardController controller = ChessBoardController();
  @override
  Widget build(BuildContext context) {
    String player1 = context.read<PlayerState>().player1;
    String player2 = context.read<PlayerState>().player2;

    return Stack(children: [
      ChessBoard(controller: controller, boardOrientation: PlayerColor.white),
      ValueListenableBuilder<Chess>(
        valueListenable: controller,
        builder: (context, game, _) {
          if (controller.isCheckMate()) {
            return AlertDialog(
                title: const Center(child: Text("Check Mate!")),
                content: Text(
                    "winner is ${controller.game.history.last.turn == PlayerColor.white ? player1 : player2}"));
          } else if (controller.isDraw()) {
            return const AlertDialog(
              title: Center(child: Text("It's a Draw!")),
            );
          } else if (controller.isStaleMate()) {
            return const AlertDialog(
              title: Center(child: Text("StaleMate!")),
            );
          } else if (controller.isInCheck()) {
            return const AlertDialog(
              content: Text("Check"),
            );
          } else {
            return Container();
          }
        },
      ),
    ]);
  }
}
