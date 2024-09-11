import 'package:flutter/material.dart';

class LoginTextForm extends StatelessWidget {
  const LoginTextForm({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.suffixIcon,
    obscureText,
  }) : obscureText = obscureText ?? false;

  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.white,
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
