// ignore_for_file: file_names

import 'package:chess_app/services/piece.dart';
import 'package:flutter/material.dart';
import 'package:chess_app/services/tile.dart';
import 'package:chess_app/services/pawn.dart';
import 'package:chess_app/utils/Images.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});
  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  late List<List<Tile>> gameState;
  bool loading = true;
  void initialSetUp() async {
    dynamic imagesMap = await fetchImage();
    late List<List<Tile>> game = List<List<Tile>>.generate(
        8,
        (index) => List<Tile>.generate(
            8, (index) => Tile(false, Piece(0, 0, "", ""), 0, 0)));

    for (int k = 0; k < 8; k++) {
      game[1][k] = Tile(
          true,
          Pawn(
              1,
              k,
              'black',
              'https://mystoreshaastra.s3.ap-south-1.amazonaws.com/Chess/Black/black_pawn.svg',
              false),
          1,
          k);
    }
    for (int i = 0; i < 8; i++) {
      game[6][i] = Tile(
          true,
          Pawn(
              1,
              i,
              'white',
              'https://mystoreshaastra.s3.ap-south-1.amazonaws.com/Chess/White/white_pawn.svg',
              false),
          1,
          i);
    }
    setState(() {
      gameState = game;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialSetUp();
//     game[7][0] = Tile(
//           true,
//           Pawn(
//               7,
//               0,
//               'white',
//               'https://mystoreshaastra.s3.ap-south-1.amazonaws.com/Chess/Black/black_pawn.svg',
//               false),
//           1,
//           0);

//   game[7][7] = { PieceType::ROOK, false };

//   // Place white knights
//   game[0][1] = { PieceType::KNIGHT, true };
//   game[0][6] = { PieceType::KNIGHT, true };

//   // Place black knights
//   game[7][1] = { PieceType::KNIGHT, false };
//   game[7][6] = { PieceType::KNIGHT, false };

//   // Place white bishops
//   game[0][2] = { PieceType::BISHOP, true };
//   game[0][5] = { PieceType::BISHOP, true };

//   // Place black bishops
//   game[7][2] = { PieceType::BISHOP, false };
//   game[7][5] = { PieceType::BISHOP, false };

//   // Place white queen
//   game[0][3] = { PieceType::QUEEN, true };

//   // Place black queen
//   game[7][3] = { PieceType::QUEEN, false };

//   // Place white king
//   game[0][4] = { PieceType::KING, true };

//   // Place black king
//   game[7][4] = { PieceType::KING, false };
// }
  }

  @override
  Widget build(BuildContext context) {
    late final double titleWidth = MediaQuery.of(context).size.width / 8;
    return loading
        ? const Center(child: Text('Loading'))
        : Column(
            children: [
              ...List.generate(
                  8,
                  (inde) => Row(children: [
                        ...List.generate(
                            8,
                            (index) => Container(
                                width: titleWidth,
                                height: titleWidth,
                                color: (inde % 2 == 0)
                                    ? (index % 2 != 0)
                                        ? Colors.black
                                        : Colors.white
                                    : (index % 2 == 0)
                                        ? Colors.black
                                        : Colors.white,
                                child: gameState[inde][index].isPiecePresent
                                    ? Image(
                                        image: NetworkImage(
                                            gameState[inde][index].piece.image))
                                    : null))
                      ]))
            ],
          );
  }
}
