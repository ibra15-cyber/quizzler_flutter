class Question {
  String questionText;
  bool questionAnswer;

  Question(String q, bool a){
    this.questionAnswer = a;
    this.questionText = q;
  }
//the constructor could be simply
//   Question(this.questionAnswer, this.questionText){
//   }
}

//same as java class
//same as java constructor