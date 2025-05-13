import 'package:flutter/material.dart';

enum AnswerButtonState {
  defaultState,
  correct,
  incorrect,
  normal,
}

const answerButtonStateColorMap = {
  AnswerButtonState.defaultState: Color.fromARGB(255, 38, 21, 66),
  AnswerButtonState.correct: Color.fromARGB(255, 4, 95, 9),
  AnswerButtonState.incorrect: Color.fromARGB(255, 122, 0, 0),
};
const answerButtonTextColor = Color.fromARGB(255, 255, 255, 255);

// Style for answer buttons
class AnswerButtonStyles {

  static ButtonStyle getButtonStyle(AnswerButtonState buttonState) {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      backgroundColor: answerButtonStateColorMap[buttonState] ?? answerButtonStateColorMap[AnswerButtonState.defaultState],
      foregroundColor: answerButtonTextColor,
      textStyle: const TextStyle(
        fontSize: 18,
        color: answerButtonTextColor,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    );
  }
/*
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
  */
}