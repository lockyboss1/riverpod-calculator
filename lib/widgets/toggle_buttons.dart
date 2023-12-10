import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final bool isLeft;
  final Color color;
  final Color textColor;

  const RoundedButton({
    required this.text,
    required this.isLeft,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: isLeft ? const Radius.circular(12.0) : Radius.zero,
            topRight: !isLeft ? const Radius.circular(12.0) : Radius.zero,
            bottomLeft: isLeft ? const Radius.circular(12.0) : Radius.zero,
            bottomRight: !isLeft ? const Radius.circular(12.0) : Radius.zero,
          ),
        ),
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 10,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
