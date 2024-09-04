import 'package:flutter/material.dart';
import 'package:jayhanuman/SnakesandLaddersModel.dart';
import 'package:provider/provider.dart';

class ManageSnakesLaddersScreen extends StatefulWidget {
  @override
  _ManageSnakesLaddersScreenState createState() =>
      _ManageSnakesLaddersScreenState();
}

class _ManageSnakesLaddersScreenState extends State<ManageSnakesLaddersScreen> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  bool _isSnake = true;

  void _addOrUpdateSnakeLadder(SnakesAndLaddersModel model) {
    int start = int.parse(_startController.text);
    int end = int.parse(_endController.text);
    model.addOrUpdateSnakeLadder(_isSnake, start, end);
    // Clear the text fields after adding/updating
    _startController.clear();
    _endController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Snakes and Ladders'),
      ),
      body: Consumer<SnakesAndLaddersModel>(
        builder: (context, model, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Snake'),
                  Switch(
                    value: !_isSnake,
                    onChanged: (value) {
                      setState(() {
                        _isSnake = !value;
                      });
                    },
                  ),
                  Text('Ladder'),
                ],
              ),
              TextField(
                controller: _startController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Start Position'),
              ),
              TextField(
                controller: _endController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'End Position'),
              ),
              ElevatedButton(
                onPressed: () => _addOrUpdateSnakeLadder(model),
                child: Text('Add/Update'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      _isSnake ? model.snakes.length : model.ladders.length,
                  itemBuilder: (context, index) {
                    final snakeOrLadder =
                        _isSnake ? model.snakes : model.ladders;
                    final key = snakeOrLadder.keys.elementAt(index);
                    final value = snakeOrLadder[key]!;
                    return ListTile(
                      title: Text('$key -> $value'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          model.deleteSnakeLadder(_isSnake, key);
                        },
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Done'),
              ),
            ],
          );
        },
      ),
    );
  }
}
