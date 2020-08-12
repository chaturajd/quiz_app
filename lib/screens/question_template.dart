import 'package:flutter/material.dart';

class QuestionTemplate extends StatelessWidget {
  final question;
  final List<String> answers;
  final Function onAnswerClick;
  final questionIndex;
  
  QuestionTemplate({this.question, this.answers, this.onAnswerClick, this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  question,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: answerWidgets(answers),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> answerWidgets(List<String> answers) {
    List<AnswerButton> answerButtons = List<AnswerButton>();
    for (var i = 0; i < answers.length; i++) {
      answerButtons.add(AnswerButton(
        answer: answers[i],
        onClick: () => {onAnswerClick(answers[i],questionIndex)},
      ));
    }
    answerButtons.shuffle();

    return answerButtons;
  }
}

class AnswerButton extends StatelessWidget {
  final String answer;
  final Function onClick;

  const AnswerButton({Key key, this.answer, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: onClick,
        child: Text(answer),
      ),
    );
  }
}
