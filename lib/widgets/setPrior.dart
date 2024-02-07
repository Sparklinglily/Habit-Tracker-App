import 'package:flutter/material.dart';
import '../presentation/styles/constants.dart';

class SetPriority extends StatefulWidget {
  const SetPriority({Key? key}) : super(key: key);

  @override
  State<SetPriority> createState() => _SetPriorityState();
}

class _SetPriorityState extends State<SetPriority> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(23, 32),
          backgroundColor: primaryDark,
        ),
        onPressed: () {},
        child: const Text(
          "Set Priority",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
