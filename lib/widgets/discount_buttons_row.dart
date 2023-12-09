import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/calculator_controller.dart';

class DiscountButtonsRow extends ConsumerWidget {
  const DiscountButtonsRow({
    required this.buttonsRow,
    super.key,
  });

  final buttonsRow;

  Color getBackgroundColor(String buttonText) {
    switch (buttonText) {
      case '10% off':
      case '20% off':
      case '30% off':
      case '50% off':
        return Colors.transparent;
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
        calculator.equals();
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Row(
        children: buttonsRow
            .map<Widget>(
              (text) => Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.rectangle,
                  ),
                  width: 10.0,
                  height: double.infinity,
                  margin: const EdgeInsets.all(11),
                  child: ElevatedButton(
                    onPressed: () => onClickedButton(text, ref),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getBackgroundColor(text),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
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
    );
  }
}
