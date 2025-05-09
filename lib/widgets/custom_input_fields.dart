import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {
  final Function(String) onSaved;
  final String regEx;
  final String hintText;
  final bool obscureText;
  const CustomTextFormFields({
    super.key,
    required this.onSaved,
    required this.regEx,
    required this.hintText,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onSaved: (value) => onSaved(value!),
        cursorColor: Colors.black,
        style: TextStyle(color: const Color.fromARGB(255, 176, 189, 200)),
        obscureText: obscureText,
        validator: (value) {
          return RegExp(regEx).hasMatch(value!) ? null : 'Enter a valid value';
        },
        decoration: InputDecoration(
            fillColor: Color.fromRGBO(30, 29, 37, 1.01),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white54)));
  }
}
