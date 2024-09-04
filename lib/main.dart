import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jayhanuman/AdminScreen.dart';
import 'package:jayhanuman/PlayerScreen.dart';
import 'package:jayhanuman/SnakesandLaddersModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SnakesAndLaddersModel(),
      child: MaterialApp(
        title: 'Snake and Ladder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snake and Ladder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayerScreen()),
                );
              },
              child: Text('Play as Player'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminScreen()),
                );
              },
              child: Text('Play as Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
