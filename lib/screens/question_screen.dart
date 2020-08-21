import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/question/question_bloc.dart';
import 'package:quiz_app/screens/question_template.dart';
import 'package:quiz_app/screens/result_template.dart';
import 'package:quiz_app/uti/color_theme.dart';

class QuestionScreen extends StatelessWidget {
  final questionBloc = QuestionBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<QuestionBloc, QuestionState>(
            bloc: questionBloc,
            builder: (context, state) {
              if (state is QuestionInitial) {
                questionBloc.add(FetchQuestions());
                // BlocProvider.of<QuestionBloc>(context).add(FetchQuestions());
                return Text("Initial State");
              } else if (state is QuestionLoadInProgress)
                return Text("Question Load in progress");
              else if (state is QuestionLoaded) {
                return QuestionTemplate(
                  question: state.question.question,
                  answers: state.question.getAnswersList(),
                  onAnswerClick: onAnswerButtonClicked,
                  questionIndex: state.questionIndex,
                  bgColor: ColorTheme().randomBgColor(),
                );
              } else if (state is QuestionSetRefreshInProgress) {
                //Loading First Time
                return LoadingQuestionSet();
              } else if (state is QuestionSetRefreshed) {
                questionBloc.add(GetQuestion(0));
                // BlocProvider.of<QuestionBloc>(context).add(GetQuestion(0));
              } else if (state is QuestionLoadInProgress) {
                return Text("Question Loading In Progress");
              } else if (state is QuestionAnswerResult) {
                return ResultTemplate(
                  bgColor: ColorTheme().randomBgColor(),
                  result: state.isCorrectAnswer,
                  nextQuestionIndex: state.nextQuestionIndex,
                  onContinue: onContinueButtonClicked,
                );
                // return Text(.toString());
              } else if (state is QuestionSetFinished) {
                // Question Set End
                return FinishQuestionSet();
                // return Column(
                //   children: <Widget>[Text("All finished"), BackButton()],
                // );
              }
              return Text("NO EVENT MATCHED");
            },
          ),
        ),
      ),
    );
  }

  Widget questionLabel(String question) {
    return Text(question);
  }

  void onContinueButtonClicked(int nextQuestionIndex) {
    debugPrint("Continue , Next Question : " + nextQuestionIndex.toString());
    questionBloc.add(GetQuestion(nextQuestionIndex));
  }

  void onAnswerButtonClicked(String ans, int questionIndex) {
    questionBloc.add(QuestionAnswered(ans, questionIndex));
    // print("AnswerClicked" + ans);
  }
}

class FinishQuestionSet extends StatelessWidget {
  const FinishQuestionSet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: BackButton(
              color: Colors.white,
            ),
          ),
          Text(
            "HOME",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
            ),
          )
        ],
      ),
    );
  }
}

class LoadingQuestionSet extends StatelessWidget {
  const LoadingQuestionSet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
