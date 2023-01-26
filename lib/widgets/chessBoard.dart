import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class Board extends StatefulWidget {
  const Board({super.key});
  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  ChessBoardController controller = ChessBoardController();
  @override
  Widget build(BuildContext context) {
    late final double titleWidth = MediaQuery.of(context).size.width / 8;
    return ChessBoard(controller: controller);
  }
}
