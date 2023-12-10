import 'package:demo_app/widgets/discount_buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/calculator_buttons.dart';


class CalculatorPage extends StatelessWidget {
  const CalculatorPage({
    super.key,
  });  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
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
            Expanded(flex: 1, child: DiscountButtons()),
            Expanded(flex: 3, child: CalculatorButtons())
          ],
        ),
      ),
    );
  }
}
