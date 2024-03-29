import "question.dart";

class QuizBrain{
  //making questionNumber private so as to make it immutable except here
  int _questionNumber = 0;
  //underscore in front of questionBank is making it private
  List<Question> _questionBank = [
    //list of constructor objects with names
    //we could have done it separately and call the names inside this list

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



  //accesor method to return question test
  //by taking question number
  //the argument not necessarily need to take questionNum from the main page
  //because our questionNumber is visible here, we do not need to passed it in our
  //methods. they can all see it
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  //accessor method to get question answer
  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }

  //mutator method to check if you can click to the next question
  //to make sure we don't run into any error should we get to the end of the list
  void nextQuestion(){
    if(_questionNumber < _questionBank.length - 1){
      _questionNumber++;
    }
  }

  //if question number is equal to our last greater than the last total number in the list
  //return true else false
  bool isFinished(){
    if(_questionNumber >= _questionBank.length -1 ){
      return true;
    } else{
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
  }

}