import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.orange[300],
        textColor: Colors.white,
        child: Text(answerText),
        //ora stiamo chiedendo di eseguire la funzione costruita in precedenza quando questo il tasto viene premuto .Questo è possibile rimuovendo le parentesi , altrimenti la funzione verrebbe eseguita in automatico non appena letta e non sul premere del tasto.
        onPressed: selectHandler,
      ),
    );
  }
}
