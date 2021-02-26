import 'dart:collection';

///
/// this class represents the questions
/// @author Saeed
/// since 2021-02-26
class Question {
  String questionText;
  bool questionAnswer;

  Question(String questionText, bool questionAnswer) {
    this.questionAnswer = questionAnswer;
    this.questionText = questionText;
  }
}
