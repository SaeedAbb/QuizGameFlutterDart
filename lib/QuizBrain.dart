import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Question.dart';

///
/// This class manges the quiz
/// @author Saeed
/// since 2021-02-26
class QuizBrain {
  int _questionNumber = 0;
  List<Widget> _scoreKeeper = [];
  int rightAnswers = 0;
  int falseAnswers = 0;
  final List<Question> _questionList = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  ///This method is responsible to get return the icon
  ///if the answer is true the icon which will be returned is check
  ///if the answer is false the icon which will be returned is close
  bool returnIcon(bool usersAnswer) {
    if (nextQuestion()) {
      print(_questionNumber);
      if (_questionList[_questionNumber - 1].questionAnswer == usersAnswer) {
        _scoreKeeper
            .add(Expanded(child: Icon(Icons.check, color: Colors.green)));
        rightAnswers++;
      } else {
        _scoreKeeper.add(Expanded(child: Icon(Icons.close, color: Colors.red)));
        falseAnswers++;
      }
      return true;
    } else {
      return false;
    }
  }

  List<Question> getQuestionList() {
    return _questionList;
  }

  bool nextQuestion() {
    if (_questionNumber < _questionList.length - 1) {
      _questionNumber++;
      return true;
    } else {
      _questionNumber = 0;
      return false;
    }
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  List<Widget> getScoreKeeper() {
    return _scoreKeeper;
  }

  String gameStatus() {
    if (rightAnswers > falseAnswers) {
      return 'You have won the game ';
    } else {
      return 'You have lost the game';
    }
  }

  void startGameAgain() {
    _questionNumber = 0;
    _scoreKeeper.clear();
    rightAnswers = 0;
    falseAnswers = 0;
  }
}
