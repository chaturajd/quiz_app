import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/question/question_bloc.dart';
import 'package:quiz_app/screens/question_template.dart';
import 'package:quiz_app/screens/result_template.dart';

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
                );
                // return questionLabel(state.question.question);
              } else if (state is QuestionSetRefreshInProgress) {
                return Text("QuestionSetRefreshInProgress");
              } else if (state is QuestionSetRefreshed) {
                questionBloc.add(GetQuestion(0));
                // BlocProvider.of<QuestionBloc>(context).add(GetQuestion(0));
              } else if (state is QuestionLoadInProgress) {
                return Text("Question Loading In Progress");
              } else if (state is QuestionAnswerResult) {
                return ResultTemplate(
                  result: state.isCorrectAnswer,
                  nextQuestionIndex: state.nextQuestionIndex,
                  onContinue: onContinueButtonClicked,
                );
                // return Text(.toString());
              } else if (state is QuestionSetFinished) {
                return Column(
                  children: <Widget>[Text("All finished"), BackButton()],
                );
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
