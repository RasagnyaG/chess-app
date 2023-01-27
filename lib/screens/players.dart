import 'package:chess_app/screens/game.dart';
import 'package:chess_app/services/playerState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final player1Controller = TextEditingController();
final player2Controller = TextEditingController();

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  State<PlayersPage> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/background.jpeg'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            toolbarHeight: 180,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'APP FROM CFI',
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
                        child: const Text('BACK'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (player1Controller.text != '' &&
                              player2Controller.text != '') {
                            context.read<PlayerState>().setPlayers(
                                player1Controller.text, player2Controller.text);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      "Choose A Game",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize:
                                                  const Size.fromHeight(
                                                      40), // NEW
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<PlayerState>()
                                                  .setGame("CHESS");
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const GameScreen(),
                                                  ));
                                            },
                                            child: const Text('CHESS')),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize:
                                                  const Size.fromHeight(
                                                      40), // NEW
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<PlayerState>()
                                                  .setGame("TIC TAC TOE");
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const GameScreen(),
                                                  ));
                                            },
                                            child: const Text('TIC TAC TOE'))
                                      ],
                                    ),
                                  );
                                });
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[400])),
                        child: const Text('CHOOSE'),
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
        body: Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {0: FractionColumnWidth(.15)},
              children: <TableRow>[
                TableRow(children: <Widget>[
                  Container(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Center(
                        child: Text('Player 1',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18))),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Center(
                        child: Text('Player 2',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18))),
                  )
                ]),
                TableRow(children: <Widget>[
                  const Center(
                      child: Text('NAME',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 0.1))),
                  Center(
                    child: SizedBox(
                      width: 145,
                      height: 45,
                      child: TextField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white),
                          controller: player1Controller),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 145,
                      height: 45,
                      child: TextField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white),
                        controller: player2Controller,
                      ),
                    ),
                  )
                ]),
                TableRow(children: <Widget>[
                  Container(),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Image(
                      image: AssetImage('assets/pawn_white.png'),
                      height: 150,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Image(
                      image: AssetImage('assets/pawn_black.png'),
                      height: 150,
                    ),
                  ),
                ])
              ],
            )),
      ),
    );
  }
}
