import 'package:flutter/material.dart';

// Button state constants
const int BUTTON_STATE_DEFAULT = 0;
const int BUTTON_STATE_CORRECT = 1;
const int BUTTON_STATE_INCORRECT = 2;

// Colors for answer buttons
class AnswerButtonColors {
  static const Color defaultColor = Color.fromARGB(255, 38, 21, 66);
  static const Color correctColor = Color.fromARGB(255, 4, 95, 9);
  static const Color incorrectColor = Color.fromARGB(255, 122, 0, 0);
  static const Color textColor = Color.fromARGB(255, 255, 255, 255);
}

// Style for answer buttons
class AnswerButtonStyles {
  static ButtonStyle getButtonStyle(int buttonState) {
    Color backgroundColor;
    
    switch (buttonState) {
      case BUTTON_STATE_CORRECT:
        backgroundColor = AnswerButtonColors.correctColor;
        break;
      case BUTTON_STATE_INCORRECT:
        backgroundColor = AnswerButtonColors.incorrectColor;
        break;
      default:
        backgroundColor = AnswerButtonColors.defaultColor;
    }
    
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      backgroundColor: backgroundColor,
      foregroundColor: AnswerButtonColors.textColor,
      textStyle: const TextStyle(
        fontSize: 18,
        color: AnswerButtonColors.textColor,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    );
  }
}