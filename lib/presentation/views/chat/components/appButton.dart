import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';

class AppButton extends StatelessWidget {
  final String text;
  void Function()? onTap;

  AppButton({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: primaryDark, borderRadius: BorderRadius.circular(8)),
        height: 50,
        width: size.height * 0.43,
        child: const Center(
          child: Text(
            'Track your progress',
            style: TextStyle(
                fontSize: 18, color: background, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
