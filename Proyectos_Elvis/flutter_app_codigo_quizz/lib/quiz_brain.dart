import 'package:flutter_app_codigo_quizz/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(q: "La Tierra es plana?", a: false),
    Question(q: "El hombre llegó a la luna?", a: true),
    Question(q: "Ella me quiere?", a: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void reset(){
    _questionNumber = 0;
  }

  bool isFinished(){
    if(_questionNumber >= _questionBank.length-1){
      return true;
    }else{
      return false;
    }
  }

}
