part of 'question_bloc.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();
}

class QuestionInitial extends QuestionState {
  @override
  List<Object> get props => [];
}

class QuestionLoadInProgress extends QuestionState {
  @override
  List<Object> get props => null;
}

class QuestionLoaded extends QuestionState {
  final Question question;
  final questionIndex;
  final int nextQuestionIndex;
  QuestionLoaded(this.question, this.nextQuestionIndex, this.questionIndex) {
    // print("State: Question Loaded" + question.question);
  }

  @override
  List<Object> get props => [question.question];
}

class QuestionSetRefreshInProgress extends QuestionState {
  @override
  List<Object> get props => null;
}

class QuestionSetRefreshed extends QuestionState {
  @override
  List<Object> get props => null;
}

class QuestionSetFinished extends QuestionState {
  @override
  List<Object> get props => null;
}

class QuestionAnswerResult extends QuestionState {
  final bool isCorrectAnswer;
  final int nextQuestionIndex;
  QuestionAnswerResult(this.isCorrectAnswer, this.nextQuestionIndex);

  @override
  List<Object> get props => [isCorrectAnswer];
}
