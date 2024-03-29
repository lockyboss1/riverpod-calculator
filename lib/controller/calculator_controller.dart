import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

import '../models/calculator.dart';
import '../utils.dart';

class CalculatorNotifier extends StateNotifier<Calculator> {
  CalculatorNotifier()
      : super(const Calculator(
          equation: '0',
          result: '0',
          shouldAppend: true,
        ));

  void delete() {
    final equation = state.equation;

    if (equation.isNotEmpty) {
      final newEquation = equation.substring(0, equation.length - 1);

      if (newEquation.isEmpty) {
        reset();
      } else {
        state = state.copyWith(equation: newEquation);
        calculate();
      }
    }
  }

  void reset() {
    state = state.copyWith(
      equation: '0',
      result: '0',
    );
  }

  void resetResult() {
    final equation = state.result;

    state = state.copyWith(
      equation: equation,
      shouldAppend: false,
    );
  }

  void calculateDiscount(double discountPercentage) {
    try {
      final expression =
          state.equation.replaceAll('⨯', '*').replaceAll('÷', '/');
      final exp = Parser().parse(expression);
      final model = ContextModel();

      final originalAmount = exp.evaluate(EvaluationType.REAL, model);

      if (originalAmount is double) {
        final discountedAmount =
            originalAmount * (1.0 - (discountPercentage / 100.0));
        state = state.copyWith(result: discountedAmount.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void apply10PercentDiscount() {
    calculateDiscount(10);
  }

  void apply20PercentDiscount() {
    calculateDiscount(20);
  }

  void apply30PercentDiscount() {
    calculateDiscount(30);
  }

  void apply50PercentDiscount() {
    calculateDiscount(50);
  }

  void append(String buttonText) {
    final equation = () {
      if (Utils.isOperator(buttonText) &&
          Utils.isOperatorAtEnd(state.equation)) {
        final newEquation =
            state.equation.substring(0, state.equation.length - 1);

        return newEquation + buttonText;
      } else if (state.shouldAppend!) {
        return state.equation == '0' ? buttonText : state.equation + buttonText;
      } else {
        return Utils.isOperator(buttonText)
            ? state.equation + buttonText
            : buttonText;
      }
    }();

    state = state.copyWith(equation: equation, shouldAppend: true);
    calculate();
  }

  void equals() {
    calculate();
    resetResult();
  }

  void calculate() {
    final expression = state.equation.replaceAll('⨯', '*').replaceAll('÷', '/');

    try {
      final exp = Parser().parse(expression);
      final model = ContextModel();

      final result = '${exp.evaluate(EvaluationType.REAL, model)}';
      state = state.copyWith(result: result);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Calculator>((ref) {
  return CalculatorNotifier();
});
