import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = new QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain
                    .getQuestionList()[quizBrain.getQuestionNumber()]
                    .questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  if (!quizBrain.returnIcon(true)) {
                    showAlert();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  if (!quizBrain.returnIcon(false)) {
                    showAlert();
                  }
                });
              },
            ),
          ),
        ),
        Row(children: quizBrain.getScoreKeeper()),
      ],
    );
  }

  var alertStyle = AlertStyle(
    isCloseButton: false,
    isOverlayTapDismiss: false,
    backgroundColor: Colors.white,
    overlayColor: Colors.grey.shade900,
  );

  void showAlert() {
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: 'Game ended',
      desc: quizBrain.gameStatus(),
      buttons: [
        DialogButton(
          color: Colors.blue,
          child: Text(
            'Try Again ',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              quizBrain.startGameAgain();
              Navigator.pop(context);
            });
          },
        )
      ],
    ).show();
  }
}
