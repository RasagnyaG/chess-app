import 'package:chess_app/services/playerState.dart';
import 'package:chess_app/widgets/chessBoard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    String player1 = context.read<PlayerState>().player1;
    String player2 = context.read<PlayerState>().player2;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpeg'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            toolbarHeight: 180,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'CHESS FROM CFI',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red[400])),
                        child: const Text('GIVE UP'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[400])),
                        child: const Text('UNDO'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            centerTitle: true,
            automaticallyImplyLeading: false),
        body: Center(
          child: Column(
            children: [
              const ChessBoard(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
                  Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      player1,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Image(
                      image: AssetImage('assets/pawn_black.png'),
                      height: 100,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      player2,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Image(
                      image: AssetImage('assets/pawn_white.png'),
                      height: 100,
                    )
                  ],
                )
              ]),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
