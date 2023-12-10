import 'package:flutter/material.dart';

import 'discount_buttons_row.dart';

class DiscountButtons extends StatelessWidget {
  const DiscountButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: const Column(
        children: [
          DiscountButtonsRow(
            buttonsRow: ['10% off', '20% off', '30% off', '50% off'],
          ),
        ],
      ),
    );
  }
}
