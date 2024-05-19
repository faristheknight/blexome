import 'package:flutter/material.dart';

class ProfitAndSalesWidget extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color textColor;
  final double width;
  final double height;
  final double borderWidth;
  final BorderRadiusGeometry borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final Color iconColor;
  final IconData? icon; // Make the icon parameter nullable

  const ProfitAndSalesWidget({
    super.key,
    required this.text,
    required this.borderColor,
    required this.textColor,
    required this.width,
    required this.height,
    required this.borderWidth,
    required this.borderRadius,
    required this.fontSize,
    required this.fontWeight,
    required this.iconColor,
    this.icon, // Add icon parameter
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: textColor, fontSize: fontSize),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(color: borderColor, width: borderWidth),
          ),
        ),
        if (icon != null)
          const SizedBox(
            width: 5,
          ),
        if (icon != null)
          Icon(
            icon,
            color: iconColor,
          ),
      ],
    );
  }
}
