import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.finishQuiz, required this.saveUserAnswer});

  final void Function() finishQuiz;
  final void Function(int questionIndex, String answer) saveUserAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionIndex = 0;
  var currentAnswerState =
      0; // 0 = not answered, 1 = answered correctly, 2 = answered incorrectly
  QuizQuestion? currentQuestionData;
  List<String> currentAnswers = <String>[];
  String? currentUserAnswer;

  @override
  void initState() {
    super.initState();
    currentQuestionData = questions[questionIndex];
    if (currentQuestionData != null) {
      currentAnswers = currentQuestionData!.getShuffledAnswers();
    }
  }

  void nextQuestion() {
    if (questionIndex == questions.length - 1) {
      // Show results or navigate to results screen
      widget.finishQuiz();
      return;
    }
    setState(() {
      currentAnswerState = 0; // Reset answer state for the next question
      questionIndex++;
      currentUserAnswer = null;
      currentQuestionData = questions[questionIndex];
      if (currentQuestionData != null) {
        currentAnswers = currentQuestionData!.getShuffledAnswers();
      }
    });
  }

  void answerQuestion(String userAnswer) {
    if (currentAnswerState != 0) {
      return; // Prevent answering again
    }
    setState(() {
      bool isCorrect = currentQuestionData!.isCorrectAnswer(userAnswer);
      currentUserAnswer = userAnswer;
      currentAnswerState =
          isCorrect ? 1 : 2; // Set answer state based on correctness
      widget.saveUserAnswer(questionIndex, userAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
            Text(
              currentQuestionData!.question,
              style: GoogleFonts.lato(
                fontSize: 24,
                color: const Color.fromARGB(255, 201, 153, 251),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ...currentAnswers.map((answer) {
              var currentButtonState = 0; // Default button state
              if (currentAnswerState != 0) {
                if (currentUserAnswer == answer) {
                  if (currentQuestionData!.isCorrectAnswer(answer)) {
                    currentButtonState = 1; // Correct answer
                  } else {
                    currentButtonState = 2; // Incorrect answer
                  }
                } else if (currentQuestionData!.isCorrectAnswer(answer)) {
                  currentButtonState = 1; // Correct answer
                }
              }
              return AnswerButton(
                answerQuestion: answerQuestion,
                currentAnswer: answer,
                currentButtonState:
                    currentButtonState, // Set button state based on answer state
              );
            }),
            const SizedBox(height: 10),
            if (currentAnswerState != 0) ...[
              TextButton.icon(
                onPressed: nextQuestion,
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 47, 17, 95),
                  foregroundColor: const Color.fromARGB(255, 236, 216, 248),
                  textStyle: GoogleFonts.lato(
                    fontSize: 20,
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  fixedSize: Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  iconSize: 20,
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Next Question!'),
              ),
            ] else
              const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
