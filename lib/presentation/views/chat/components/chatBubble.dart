import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryLight,
      ),
      child: Text(
        message,
        style: TextStyle(color: background),
      ),
    );
  }
}
