import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (resultScore <= 3) {
      resultText = "Non ci siamo";
    } else if (resultScore <= 6) {
      resultText = "Bravo , ma potresti migliorare";
    } else {
      resultText = "Punteggio Pieno";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz !'),
            onPressed: resetHandler,
            textColor: Colors.blue[400],
          ),
        ],
      ),
    );
  }
}
