import 'package:chess_app/screens/landing.dart';
import 'package:chess_app/services/playerState.dart';
import 'package:chess_app/widgets/chessBoard.dart';
import 'package:chess_app/widgets/ttt.dart';
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
    String gameName = context.read<PlayerState>().game;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpeg'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            toolbarHeight: 150,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$gameName FROM CFI',
                  style: const TextStyle(
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
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LandingScreen(),
                            )),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red[400])),
                        child: const Text('GIVE UP'),
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
        body: Column(
          children: [
            gameName == 'CHESS' ? const Board() : const TTT(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        player1,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const Image(
                        image: AssetImage('assets/pawn_black.png'),
                        height: 50,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        player2,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const Image(
                        image: AssetImage('assets/pawn_white.png'),
                        height: 50,
                      )
                    ],
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
