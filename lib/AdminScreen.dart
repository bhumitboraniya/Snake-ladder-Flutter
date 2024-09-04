import 'package:flutter/material.dart';
import 'package:jayhanuman/BoardWidget.dart';
import 'package:jayhanuman/manage.dart';
import 'package:provider/provider.dart';
import 'package:jayhanuman/SnakesandLaddersModel.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _currentPosition = 0;
  final TextEditingController _diceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the SnakesAndLaddersModel from the Provider
    final model = Provider.of<SnakesAndLaddersModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Mode'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Current Position: $_currentPosition'),
          TextField(
            controller: _diceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter number (1-6)'),
          ),
          ElevatedButton(
            onPressed: () => _movePlayer(model),
            child: Text('Move'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ManageSnakesLaddersScreen(),
                ),
              );
            },
            child: Text('Manage Snakes and Ladders'),
          ),
          Expanded(
            child: BoardWidget(
              playerPosition: _currentPosition,
              snakesAndLadders:
                  model.snakes.isNotEmpty || model.ladders.isNotEmpty
                      ? {...model.snakes, ...model.ladders}
                      : {},
            ),
          ),
        ],
      ),
    );
  }

  void _movePlayer(SnakesAndLaddersModel model) {
    int diceRoll = int.parse(_diceController.text);
    setState(() {
      _currentPosition += diceRoll;
      if (_currentPosition >= 100) {
        _currentPosition = 100;
        _showGameFinishedDialog();
      } else {
        _currentPosition = _applySnakesAndLadders(model, _currentPosition);
      }
    });
  }

  int _applySnakesAndLadders(SnakesAndLaddersModel model, int position) {
    while (model.snakes.containsKey(position) ||
        model.ladders.containsKey(position)) {
      if (model.snakes.containsKey(position)) {
        position = model.snakes[position]!;
      } else if (model.ladders.containsKey(position)) {
        position = model.ladders[position]!;
      }
    }
    return position;
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
}
