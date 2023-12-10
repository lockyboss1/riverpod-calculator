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
      case '10% off':
        calculator.reset();
        break;
      case '20% off':
        calculator.equals();
        break;
      case '30% off':
        calculator.delete();
        break;
      case '50% off':
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttonsRow
            .map<Widget>(
              (text) => Expanded(
                child: ElevatedButton(
                  onPressed: () => onClickedButton(text, ref),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFEFAE0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0),
                            side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
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
