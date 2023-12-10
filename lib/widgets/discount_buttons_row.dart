import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/calculator_controller.dart';

class DiscountButtonsRow extends ConsumerWidget {
  const DiscountButtonsRow({
    required this.buttonsRow,
    this.selectedButton,
    super.key,
  });

  final buttonsRow;
  final String? selectedButton;

  Color getBackgroundColor(String buttonText) {
    switch (buttonText) {
      case '10% off':
        return Colors.amber;
      default:
        return const Color(0xFFFEFAE0);
    }
  }

  void onClickedButton(String buttonText, WidgetRef ref) {
    final calculator = ref.read(calculatorProvider.notifier);

    switch (buttonText) {
      case '10% off':
        calculator.apply10PercentDiscount();
        break;
      case '20% off':
        calculator.apply20PercentDiscount();
        break;
      case '30% off':
        calculator.apply30PercentDiscount();
        break;
      case '50% off':
        calculator.apply50PercentDiscount();
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
                    backgroundColor: MaterialStateProperty.all<Color>(
                      getBackgroundColor(text),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: text == '10% off' ? Colors.white : Colors.black,
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
