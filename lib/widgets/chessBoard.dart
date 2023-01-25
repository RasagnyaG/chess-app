import 'package:flutter/material.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, childAspectRatio: 1),
          itemCount: 64,
          itemBuilder: (BuildContext ctx, int index) {
            final row = index ~/ 8;
            final col = index % 8;
            return Container(
              color: (row % 2 == 0)
                  ? (col % 2 == 0 ? Colors.black : Colors.white)
                  : (col % 2 == 1 ? Colors.black : Colors.white),
            );
          }),
    );
  }
}
