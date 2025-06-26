import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        errorText: errorText,
        //   border: InputBorder.none,
        fillColor: Color(0xFFF2F2F5),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Make corners circular
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFF2F2F5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFF2F2F5)),
        ),
      ),
      validator: validator,
    );
  }
}
