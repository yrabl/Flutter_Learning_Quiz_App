import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/summary_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  final Map<int, String> userAnswers = {};

  void saveUserAnswer(int questionIndex, String answer) {
    userAnswers[questionIndex] = answer;
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void summarizeQuiz() {
    setState(() {
      activeScreen = 'summary-screen';
    });
    // Handle the summary of the quiz here (e.g., show results)
  }

  void returnToStartScreen() {
    setState(() {
      userAnswers.clear(); // Clear user answers for a new quiz
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screenWidget;
    switch (activeScreen) {
      case 'start-screen':
        screenWidget = StartScreen(startQuiz: switchScreen);
        break;
      case 'question-screen':
        screenWidget = QuestionScreen(finishQuiz: summarizeQuiz, saveUserAnswer: saveUserAnswer);
        break;
      case 'summary-screen':
        screenWidget = SummaryScreen(userAnswers, restartQuiz: returnToStartScreen);
        break;
      default:
        screenWidget = StartScreen(startQuiz: switchScreen);
    }

    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 31, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
