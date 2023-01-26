import 'package:flutter/material.dart';

class PlayerState extends ChangeNotifier {
  late String player1;
  late String player2;
  late String game;

  void setPlayers(String p1, String p2) {
    player1 = p1;
    player2 = p2;
  }

  void setGame(String game) {
    this.game = game;
  }
}
