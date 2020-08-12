import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/data_provider/question_provider.dart';

class QuestionsRepository{
  final QuestionProvider provider;
  List<Question> questions = new List<Question>();

  QuestionsRepository(this.provider){
    // _initialize();
  }

  Future<bool> initialize() async{
    String rawQs = await provider.fetchQuestions();
    var decoded = jsonDecode(rawQs);
    questions.clear();
    debugPrint("Initializing question List");
    for(var question in decoded["results"]){
      print(question["category"]);
      Question q = new Question.fromJson(question);
      questions.add(q);
    }
    debugPrint("Initialized : " + questions.length.toString());
    return true;
  }

  Question getQuestion(int index){
    if(questions == null){
      debugPrint("Question List is Empty");
      return null;
    }
    else if(-1 < index && index < questions.length){
      return questions[index];
    }
    else{
      debugPrint("Index is Out of Range");
      return null;
    }
  }

  int totalQuestions(){
    return questions.length;
  }

  refreshQuestionSet() async {
    await initialize();
  }
}