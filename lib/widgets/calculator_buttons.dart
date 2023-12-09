import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/calculator_controller.dart';
import 'calculator_buttons_row.dart';

class CalculatorButtons extends ConsumerWidget {
  const CalculatorButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculator = ref.watch(calculatorProvider);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.black, // Border color
            width: 0.5,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(10.0), // Border radius
              ),
              padding: const EdgeInsets.only(bottom: 20, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    calculator.result,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 26),
                  ),
                ],
              ),
            ),
            const CalculatorButtonsRow(
              buttonsRow: ['1', '2', '3'],
            ),
            const CalculatorButtonsRow(
              buttonsRow: ['4', '5', '6'],
            ),
            const CalculatorButtonsRow(
              buttonsRow: ['7', '8', '9'],
            ),
            const CalculatorButtonsRow(
              buttonsRow: ['0', 'Clear', 'Enter'],
            ),
          ],
        ),
      ),
    );
  }
}