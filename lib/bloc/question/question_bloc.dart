import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:quiz_app/data_provider/question_providable.dart';
import 'package:quiz_app/data_provider/question_provider.dart';
import 'package:quiz_app/data_provider/remote_questions.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repository/questions_repository.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionsRepository qrep;
  QuestionProvidable remoteProvider;
  QuestionProvider questionProvider;

  int totalQuestions;

  QuestionBloc() : super() {
    remoteProvider = RemoteQuestions();
    questionProvider = QuestionProvider(remoteProvider);
    qrep = QuestionsRepository(questionProvider);
  }

  QuestionState get initialState => QuestionInitial();

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
    if (event is FetchQuestions)
      yield* fetchQuestions();
    else if (event is GetQuestion)
      yield* getQuestion(event);
    else if (event is RefreshQuestionSet)
      yield* refreshQuestionSet();
    else if (event is QuestionAnswered) yield* questionAnswered(event);
  }

  Stream<QuestionState> questionAnswered(QuestionAnswered qAns) async* {
    yield QuestionSetRefreshInProgress();
    if (qrep.getQuestion(qAns.questionIndex).correctAnswer == qAns.answer)
      yield QuestionAnswerResult(true, qAns.questionIndex + 1);
    else
      yield QuestionAnswerResult(false, qAns.questionIndex + 1);
  }

  Stream<QuestionState> fetchQuestions() async* {
    yield QuestionSetRefreshInProgress();
    await qrep.initialize();
    totalQuestions = qrep.totalQuestions();
    yield QuestionSetRefreshed();
  }

  Stream<QuestionState> refreshQuestionSet() async* {
    yield QuestionSetRefreshInProgress();

    await qrep.refreshQuestionSet();
    debugPrint("Total number of Question " + totalQuestions.toString());
    yield QuestionSetRefreshed();


    yield QuestionInitial();
  }

  Stream<QuestionState> getQuestion(GetQuestion event) async* {
    debugPrint("Getting Question " + event.index.toString());
    yield QuestionLoadInProgress();
    if (event.index > totalQuestions - 1) {
      yield QuestionSetFinished();
    } else {
      final question = qrep.getQuestion(event.index);
      if (question == null) {
        yield QuestionSetFinished();
      }
      yield QuestionLoaded(question, event.index + 1, event.index);
    }
  }
}
