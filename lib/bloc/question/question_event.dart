part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();
}

class GetQuestion extends QuestionEvent {
  final int index;
  GetQuestion(this.index);
  @override
  List<Object> get props => [index];
}

class RefreshQuestionSet extends QuestionEvent {
  @override
  List<Object> get props => null;
}

class FetchQuestions extends QuestionEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class QuestionAnswered extends QuestionEvent {
  final answer;
  final questionIndex;

  QuestionAnswered(this.answer, this.questionIndex);
  
  @override
  List<Object> get props => [answer];
}
