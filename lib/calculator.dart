import 'package:flutter/material.dart';

import 'views/calulator_page.dart';

class SimpleCalculator extends StatelessWidget {
  const SimpleCalculator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFFFEFAE0),
      ),
      home: const CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
