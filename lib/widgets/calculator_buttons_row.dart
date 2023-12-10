import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/calculator_controller.dart';

class CalculatorButtonsRow extends ConsumerWidget {
  const CalculatorButtonsRow({
    required this.buttonsRow,
    super.key,
  });

  final buttonsRow;

  Color getBackgroundColor(String buttonText) {
    switch (buttonText) {
      default:
        return Colors.transparent;
    }
  }

  void onClickedButton(String buttonText, WidgetRef ref) {
    final calculator = ref.read(calculatorProvider.notifier);

    switch (buttonText) {
      case 'Clear':
        calculator.reset();
        break;
      case 'Enter':
        //calculator.equals();
        break;
      case '<':
        calculator.delete();
        break;
      case '':
        break;

      default:
        calculator.append(buttonText);
        break;
    }
  }

  void onLongClickedButton(String text, WidgetRef ref) {
    final calculator = ref.read(calculatorProvider.notifier);

    if (text == '<') {
      calculator.reset();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: buttonsRow
              .map<Widget>(
                (text) => Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.circle,
                    ),
                    width: 10.0,
                    height: 60,
                    margin: const EdgeInsets.all(11),
                    child: ElevatedButton(
                      onPressed: () => onClickedButton(text, ref),
                      onLongPress: () => onLongClickedButton(text, ref),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: getBackgroundColor(text),
                        elevation: 0,
                        shape: const CircleBorder(),
                      ),
                      child: text == 'Clear' || text == 'Enter'
                          ? Text(
                              text,
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          : Text(
                              text,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
