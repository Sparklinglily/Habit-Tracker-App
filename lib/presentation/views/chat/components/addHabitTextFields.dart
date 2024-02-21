import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';
import 'package:habit_help/presentation/styles/constants.dart';

class MyTextFields extends StatelessWidget {
  final String hintText;
  //final TextEditingController controller;
  const MyTextFields({required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Color.fromARGB(255, 248, 238, 247),
            focusColor: primaryDark,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: primaryDark),
              borderRadius: BorderRadius.circular(14),
            ),
            hintText: hintText),
      ),
    );
  }
}
