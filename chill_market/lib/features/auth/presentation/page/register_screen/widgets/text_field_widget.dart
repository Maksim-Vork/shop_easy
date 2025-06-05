import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String errorText;
  final String hintText;
  final TextEditingController controllerName;
  const TextFieldWidget({
    super.key,
    required this.errorText,
    required this.hintText,
    required this.controllerName,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerName,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }

        return null;
      },
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF616161)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
