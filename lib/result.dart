import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function selectHandler;

  final int score;

  Result(this.selectHandler, this.score);

  String get resultString {
    String resultText;
    if (score > 20) {
      resultText = "wow great score";
    } else {
      resultText = 'you did it';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(resultString),
            Text(
              'You scored $score',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("play again"),
              onPressed: selectHandler,
            ),
          ],
        ));
  }
}
