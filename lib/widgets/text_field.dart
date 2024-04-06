// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

Widget textField({
  required String labelText,
  onChanged,
  required String Function() errorText,
  bool obscureText = false,
}) {
  return TextField(
    style: const TextStyle(color: Colors.white),
    onChanged: onChanged,
    obscureText: obscureText,
    decoration: InputDecoration(
      errorText: errorText !=  null ? errorText() != ''? errorText(): null  : null,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
      ),

       errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red), // Define a cor da borda de erro
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red), // Define a cor da borda de erro quando o campo está focado
      ),
    ),
  );
}
