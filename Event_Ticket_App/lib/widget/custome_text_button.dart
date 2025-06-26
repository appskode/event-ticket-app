import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double height;
  final double radius;
  final bool isLoading;

  const CustomTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = const Color(0xFFDBE8F2),
      this.textColor = Colors.black,
      this.fontSize = 16,
      this.height = 48,
      this.radius = 12,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(double.infinity, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: isLoading
          ? CircularProgressIndicator()
          : Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
    );
  }
}
