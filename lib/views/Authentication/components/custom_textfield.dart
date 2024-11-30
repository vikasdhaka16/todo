import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String icon;
  final bool obscureText;
  final RxString value;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.obscureText,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        value.value = text;
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.blueGrey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          icon == 'email' ? Icons.email : Icons.lock,
          color: Colors.blueGrey,
        ),
      ),
      cursorColor: Colors.blue,
    );
  }
}
