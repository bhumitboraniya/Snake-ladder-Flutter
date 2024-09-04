import 'package:flutter/material.dart';

class SnakesAndLaddersModel with ChangeNotifier {
  final Map<int, int> _snakes = {};
  final Map<int, int> _ladders = {};

  Map<int, int> get snakes => _snakes;
  Map<int, int> get ladders => _ladders;

  void addOrUpdateSnakeLadder(bool isSnake, int start, int end) {
    if (isSnake) {
      _snakes[start] = end;
    } else {
      _ladders[start] = end;
    }
    notifyListeners();
  }

  void deleteSnakeLadder(bool isSnake, int key) {
    if (isSnake) {
      _snakes.remove(key);
    } else {
      _ladders.remove(key);
    }
    notifyListeners();
  }

  void updateSnakesAndLadders(Map<int, int> snakes, Map<int, int> ladders) {
    _snakes
      ..clear()
      ..addAll(snakes);
    _ladders
      ..clear()
      ..addAll(ladders);
    notifyListeners();
  }
}
