import 'package:flutter/material.dart';

class QuestionTemplate extends StatelessWidget {
  final question;
  final List<String> answers;
  final Function onAnswerClick;
  final questionIndex;
  final Color bgColor;

  QuestionTemplate(
      {this.question,
      this.answers,
      this.onAnswerClick,
      this.questionIndex,
      this.bgColor});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: bgColor == null ? Colors.white : bgColor,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        question,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
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
        onClick: () => {onAnswerClick(answers[i], questionIndex)},
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
