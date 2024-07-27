import 'package:flutter/material.dart';

import '../../../constants.dart';

class LoginTextFieldsWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final void Function(String)? onChanged;
  final Color borderColor;
  final Color textColor;
  final double width;
  final double height;
  final double borderWidth;
  final BorderRadius borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final Color iconColor;
  final Color filledColor;
  final IconData? icon;
  final TextEditingController? controller;
  final bool obscureText;
  final int maxlines;
  final EdgeInsetsGeometry contentPadding;
  final TextInputType textInputType;

  const LoginTextFieldsWidget(
      {super.key,
      required this.text,
      required this.hintText,
      required this.onChanged,
      required this.filledColor,
      required this.borderColor,
      required this.textColor,
      required this.width,
      required this.height,
      required this.borderWidth,
      required this.borderRadius,
      required this.fontSize,
      required this.fontWeight,
      required this.iconColor,
      this.icon,
      this.controller,
      required this.obscureText,
      required this.maxlines,
      required this.textInputType,
      required this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              height: 10,
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: fontSize),
              ),
            ),
          ],
        ),
        const SizedBox(height: 0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(color: borderColor, width: borderWidth),
              ),
              child: TextField(
                keyboardType: textInputType,
                obscureText: obscureText,
                controller: controller,
                cursorHeight: 25,
                cursorColor: kBorderColor1,
                maxLines: maxlines,
                decoration: InputDecoration(
                  fillColor: filledColor,
                  filled: true,
                  labelText: hintText,
                  labelStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: fontWeight,
                    fontSize: 14,
                  ),
                  contentPadding: contentPadding,
                  border: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: const BorderSide(
                      color: kBorderColor2,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: const BorderSide(
                      color: kDarkerBorderColor,
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        if (icon != null) const SizedBox(width: 5),
        if (icon != null)
          Icon(
            icon,
            color: iconColor,
          ),
      ],
    );
  }
}
