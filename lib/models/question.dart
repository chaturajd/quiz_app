import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Question(
      {this.category,
      this.type,
      this.difficulty,
      this.question,
      this.correctAnswer,
      this.incorrectAnswers});

  factory Question.fromJson(Map<String, dynamic> json) {
    print("Creating Question Object");
    return Question(
        category: json["category"],
        type: json["type"],
        difficulty: json["difficulty"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: json["incorrect_answers"]);
  }

  List<String> getAnswersList() {
    List<String> answers = List<String>();
    answers.add(correctAnswer);

    for (var ans in incorrectAnswers) {
      answers.add(ans);
    }

    return answers;
  }

  bool isCorrectAnswer(String answer) {
    return answer == correctAnswer ? true : false;
  }

  @override
  List<Object> get props => [question];
}
