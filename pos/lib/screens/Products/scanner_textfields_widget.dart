import 'package:flutter/material.dart';

class TextFieldsWidget extends StatelessWidget {
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
  final TextInputType textInputType;
  final TextEditingController? controller; // Added controller parameter
  // final FocusNode? focusNode; // Add focusNode parameter

  const TextFieldsWidget({
    super.key,
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
    required this.textInputType,
    this.icon,
    this.controller, // Added controller parameter

    // this.focusNode, // Add focusNode parameter to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 250,
          height: 30,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: TextField(
            controller: controller, // Added controller
            keyboardType: textInputType,
            cursorHeight: 25,
            maxLines: 10,
            decoration: InputDecoration(
              fillColor: filledColor,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: fontWeight,
                  fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 4),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
            onChanged: onChanged,
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
