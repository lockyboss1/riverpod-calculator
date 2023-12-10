import 'package:demo_app/widgets/discount_buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/calculator_buttons.dart';
import '../widgets/toggle_buttons.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 8),
          child: const Text(
            'Discount Calculator',
          ),
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  RoundedButton(
                    text: 'Item Discount',
                    color: Colors.orange,
                    isLeft: true,
                    textColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: RoundedButton(
                      text: 'Order Discount',
                      isLeft: false,
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                  //Spacer(),
                  RoundedButton(
                    text: 'Fixed Off',
                    color: Colors.orange,
                    isLeft: true,
                    textColor: Colors.white,
                  ),
                  RoundedButton(
                    text: 'Percentage Off',
                    isLeft: false,
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: DiscountButtons()),
            Expanded(flex: 5, child: CalculatorButtons())
          ],
        ),
      ),
    );
  }
}
