import 'package:quiz_app/data_provider/question_providable.dart';

class QuestionProvider{
  final QuestionProvidable _fetcher;

  QuestionProvider(this._fetcher);

  var fetched;

  Future<String> fetchQuestions(){
    try {
      return _fetcher.fetchQuestions();
    } catch (e) {
      print("Question Provider : Failed to Fetch From given fetcher");
    }
  }
}