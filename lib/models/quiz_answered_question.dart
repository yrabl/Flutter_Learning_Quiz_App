class QuizAnsweredQuestion {
  final int questionIndex;
  final String question;
  final String correctAnswer;
  final String selectedAnswer;

  const QuizAnsweredQuestion({
    required this.questionIndex,
    required this.question,
    required this.correctAnswer,
    required this.selectedAnswer,
  });

  bool get isCorrect {
    return correctAnswer == selectedAnswer;
  }
}