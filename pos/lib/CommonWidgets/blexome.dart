import 'package:flutter/material.dart';

class BlexoMeHeading extends StatelessWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final Color blexoColor;
  final Color meColor;

  const BlexoMeHeading({
    Key? key,
    required this.fontSize,
    required this.fontWeight,
    required this.blexoColor,
    required this.meColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        children: [
          TextSpan(
            text: 'Blexo',
            style: TextStyle(color: blexoColor),
          ),
          TextSpan(
            text: 'ME',
            style: TextStyle(color: meColor),
          ),
        ],
      ),
    );
  }
}
