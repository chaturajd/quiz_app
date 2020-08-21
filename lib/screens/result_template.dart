import 'package:flutter/material.dart';

class ResultTemplate extends StatelessWidget {
  final result;
  final nextQuestionIndex;
  final Function onContinue;
  final Color bgColor;

  const ResultTemplate(
      {Key key, this.result, this.onContinue, this.nextQuestionIndex, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor == null ? Colors.blueAccent : bgColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            result == true ? result_widget("Correct") : result_widget("Wrong"),
            InkWell(
              onTap: () => {
                onContinue(nextQuestionIndex),
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 15),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            // RaisedButton(
            //   onPressed: () => {onContinue(nextQuestionIndex)},
            //   child: Text(
            //     "Continue",
            //   ),
            // )
          ],
        ),
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
