import 'package:flutter/material.dart';

class HabitDetailsTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? icon;
  final Widget? switchButton;
  const HabitDetailsTile(
      {required this.title,
      required this.subTitle,
      this.icon,
      this.switchButton,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Container(
        color: Color.fromARGB(255, 245, 239, 235),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(fontSize: 14),
          ),
          trailing: icon ?? switchButton,
        ),
      ),
    );
  }
}
