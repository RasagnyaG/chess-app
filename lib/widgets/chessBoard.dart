import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 8,
      scrollDirection: Axis.vertical,
      children: List.generate(64, (index) {
        return Container(
          key: Key(index.toString()),
          height: 10,
          color: Colors.black,
        );
      }),
    );
  }
}
