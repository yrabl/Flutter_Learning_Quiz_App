import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_answered_question.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen(this.userAnswers, {super.key, required this.restartQuiz});
  final Map<int, String> userAnswers;
  final void Function() restartQuiz;

  List<QuizAnsweredQuestion> get summaryData {
    List<QuizAnsweredQuestion> summaryData = [];

    for (var i = 0; i < userAnswers.length; i++) {
      var question = questions[i];
      var userAnswer = userAnswers[i]!;
      var correctAnswer = question.correctAnswer;
      summaryData.add(
        QuizAnsweredQuestion(
          questionIndex: i + 1,
          question: question.question,
          correctAnswer: correctAnswer,
          selectedAnswer: userAnswer,
        ),
      );
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final int correctAnswersCount = summaryData.fold<int>(
      0,
      (previuosCount, item) => previuosCount + (item.isCorrect ? 1 : 0),
    );
    final int totalQuestions = summaryData.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your answered $correctAnswersCount out of $totalQuestions questions correctly!',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color.fromARGB(255, 201, 153, 251),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            QuestionsSummary(summaryData),
            SizedBox(height: 20),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(0, 47, 17, 95),
                foregroundColor: const Color.fromARGB(255, 236, 216, 248),
                textStyle: GoogleFonts.lato(fontSize: 20),
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
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
