import 'package:flutter/material.dart';

class ResultTemplate extends StatelessWidget {
  final result;
  final nextQuestionIndex;
  final Function onContinue;
  const ResultTemplate({Key key, this.result, this.onContinue, this.nextQuestionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          result == true ? result_widget("Correct") : result_widget("Wrong"),
          RaisedButton(
            onPressed: () => {onContinue(nextQuestionIndex)},
            child: Text(
              "Continue",
            ),
          )
        ],
      ),
    );
  }

  Widget result_widget(String data) {
    return Text(
      data,
      style: TextStyle(fontSize: 64),
      textAlign: TextAlign.center,
    );
  }
}
