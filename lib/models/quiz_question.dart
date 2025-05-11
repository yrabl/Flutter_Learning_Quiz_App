class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(String question, List<String> answers)
      : question = question,
        answers = answers;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List<String>.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }

  bool isCorrectAnswer(String selectedAnswer) {
    return selectedAnswer == answers[0];
  }

  String get correctAnswer {
    return answers[0];
  }
}