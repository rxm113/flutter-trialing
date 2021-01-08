import 'package:flutter/material.dart';
import './quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _score = 0;
  final _questions = const [
    {
      'questionText': 'What\'s is your favourite colour?',
      'answers': [
        {'text': 'black', 'score': 3},
        {'text': 'blue', 'score': 1},
        {'text': 'red', 'score': 5},
        {'text': 'white', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s is your favourite animal?',
      'answers': [
        {'text': 'cat', 'score': 3},
        {'text': 'bird', 'score': 7},
        {'text': 'dog', 'score': 5},
      ],
    },
    {
      'questionText': 'Whos\'s is your favourite instrcutor?',
      'answers': [
        {'text': 'max', 'score': 3},
        {'text': 'rob', 'score': 21},
        {'text': 'tom', 'score': 1},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _questionIndex = 0;
      print("game reset");
    });
  }

  void _answerQuestion(int score) {
    _score = _score + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length + 1) {
      print('we have more questions');
    } else {
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_resetQuiz, _score),
      ),
    );
  }
}
