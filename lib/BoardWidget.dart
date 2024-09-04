import 'package:flutter/material.dart';

class BoardWidget extends StatelessWidget {
  final int playerPosition;
  final Map<int, int> snakesAndLadders;

  BoardWidget({required this.playerPosition, required this.snakesAndLadders});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
      ),
      itemBuilder: (context, index) {
        int number = 100 - index;
        String displayText = number.toString();
        if (snakesAndLadders.containsKey(number)) {
          int end = snakesAndLadders[number]!;
          if (end > number) {
            // Ladder
            displayText += ' ↑';
          } else {
            // Snake
            displayText += ' ↓';
          }
        }
        return Container(
          alignment: Alignment.center,
          color: playerPosition == number ? Colors.green : Colors.white,
          child: Text(
            displayText,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          // decoration: BoxDecoration(
          // border: Border.all(color: Colors.black),
          // ),
        );
      },
      itemCount: 100,
      shrinkWrap: true,
    );
  }
}
