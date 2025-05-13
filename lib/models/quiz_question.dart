class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  List<String> get shuffledAnswers {
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