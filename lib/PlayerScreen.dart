import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jayhanuman/BoardWidget.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  int _currentPosition = 0;
  final Random _random = Random();
  final Map<int, int> _snakesAndLadders = {
    3: 22,
    5: 8,
    11: 26,
    20: 29,
    17: 4,
    19: 7,
    27: 1,
    21: 9,
  };

  void _rollDice() {
    int diceRoll = _random.nextInt(6) + 1;
    setState(() {
      _currentPosition += diceRoll;
      if (_currentPosition >= 100) {
        _currentPosition = 100;
        _showGameFinishedDialog();
      } else if (_snakesAndLadders.containsKey(_currentPosition)) {
        _currentPosition = _snakesAndLadders[_currentPosition]!;
      }
    });
  }

  void _showGameFinishedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Finished'),
          content: Text('Congratulations! You reached 100!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentPosition = 0;
                });
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Mode'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Current Position: $_currentPosition'),
          ElevatedButton(
            onPressed: _rollDice,
            child: Text('Roll Dice'),
          ),
          Expanded(
            child: BoardWidget(
              playerPosition: _currentPosition,
              snakesAndLadders: _snakesAndLadders,
            ),
          ),
        ],
      ),
    );
  }
}
