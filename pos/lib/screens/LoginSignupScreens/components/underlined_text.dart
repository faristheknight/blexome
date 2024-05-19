import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final VoidCallback ontap;
  final TextDecoration textDecoration;
  const UnderlinedText(
      {super.key,
      required this.fontSize,
      required this.ontap,
      required this.text,
      required this.textColor,
      required this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: const Text(
        "Already Have an Account?",
        style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue),
      ),
    );
  }
}
