import 'package:flutter/material.dart';
import 'package:quiz_app/constants/styles.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerQuestion,
    required this.currentAnswer,
    required this.currentButtonState,
  });

  final void Function(String answer) answerQuestion;
  final String currentAnswer;
  final AnswerButtonState currentButtonState; // Using constants defined in styles.dart

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        answerQuestion(currentAnswer);
      },
      style: AnswerButtonStyles.getButtonStyle(currentButtonState),
      child: Text(currentAnswer, textAlign: TextAlign.center),
    );
  }
}
