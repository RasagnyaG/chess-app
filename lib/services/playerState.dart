import 'package:flutter/material.dart';

class PlayerState extends ChangeNotifier {
  late String player1;
  late String player2;

  void setPlayers(String p1, String p2) {
    player1 = p1;
    player2 = p2;
  }
}
