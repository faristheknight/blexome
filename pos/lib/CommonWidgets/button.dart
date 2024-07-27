import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color borderColor;
  final Color textColor;
  final double width;
  final double height;
  final double borderWidth;
  final double borderRadius;
  final double? textSize;

  const LanguageButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.borderColor,
    required this.textColor,
    required this.width,
    required this.height,
    required this.borderWidth,
    required this.borderRadius,
     this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: textSize??14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
