import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//class object
QuizBrain quizBrain = new QuizBrain();

int totalScore = 0;
String totalScoreS;

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Center(
            child: Text(
              "Welcome to Quizler"
            ),
          )
        ),
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
  // const QuizPage({Key? key}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //making a list for our scoreKeeper
  //we will call scoreKeeper and for each press one of x or check will display
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    //get the answer with the question
    bool correctAnswer = quizBrain.getQuestionAnswer();
    //if that answer is equal to what we will pe passing as argument

    //and after every question go to the next
    setState(() {
      //whenever we got the right answer
      //flash either a green check icon or a red cross icon
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "Finished!\nYou've reached the end of the quiz\nYour final score is: ",
          desc: totalScoreS,
        ).show();

        //go back to question 1
        quizBrain.reset();
        totalScore = 0;

        //empty the scoreKeeper list which displays check or close when we
        //got an answer right or wrong.
        scoreKeeper = [];
      } else {
        //after pressing, we want our question number to increment
        //that's to say go to the next question, which will affect the question
        //number displayed in our text. because the index will have changed
        quizBrain.nextQuestion();
        if (userPickedAnswer == correctAnswer) {
          totalScore ++;
          totalScoreS = totalScore.toString();
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              "Use the buttons below to select the right answer",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              )
            ),
          )
        ),

        Expanded(
          child: Card(
            color: Colors.teal,
            child: Center(
              child: Text(
                "Your Score is:  $totalScore",
              ),
            )
          )
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              //replacing our text with our question which is string
              //and has passing question number which will begin at index 0
              //our code has gotten complicated
              //it has gone through modification
              //1. our list of question and list of answers were integrated into one list
              //this list takes class question List<Question> hence we passed it question obj
              //this list takes para string for text and bool for answers
              //then it got abstracted by making it a class
              //now calling our list was turned private so us to use a method to access private members
              //and now we are calling it through our accessors instead of directly
              //our questionNumber too was made private hence we cant see it from here
              //but these methods from class obj quizBrain have access and used it in the code

              quizBrain.getQuestionText(),

              style: TextStyle(
                color: Colors.white,
              ),
            )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                //in order to be able to display the current question num
                //we print our question number
                // print(questionNumber);
                checkAnswer(true);
              },
              child: Text(
                "True",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                "false",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}