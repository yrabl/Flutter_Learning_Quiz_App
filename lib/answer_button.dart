import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerQuestion,
    required this.currentAnswer,
    required this.currentButtonState,
  });

  final void Function(String answer) answerQuestion;
  final String currentAnswer;
  final int
  currentButtonState; // 0 = not answered, 1 = answered correctly, 2 = answered incorrectly

  @override
  Widget build(BuildContext context) {
    var buttonBackgroundColor = const Color.fromARGB(255, 38, 21, 66);
    if (currentButtonState == 1) {
      buttonBackgroundColor = const Color.fromARGB(
        255,
        4,
        95,
        9,
      ); // Green for correct answer
    } else if (currentButtonState == 2) {
      buttonBackgroundColor = const Color.fromARGB(
        255,
        122,
        0,
        0,
      ); // Red for incorrect answer
    }

    var elevatedButtonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      backgroundColor: buttonBackgroundColor,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      textStyle: const TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 255, 255, 255),
        //height: 1.5,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    );

    return ElevatedButton(
      onPressed: () {
        answerQuestion(currentAnswer);
      },
      style: elevatedButtonStyle,
      child: Text(currentAnswer, textAlign: TextAlign.center),
    );
  }
}
