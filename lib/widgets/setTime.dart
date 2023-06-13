import 'package:flutter/material.dart';
import '../constants/constants.dart';

class SetTime extends StatefulWidget {
  const SetTime({Key? key}) : super(key: key);

  @override
  State<SetTime> createState() => _SetTimeState();
}

class _SetTimeState extends State<SetTime> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(23, 32),
        backgroundColor: background,
      ),
      onPressed: () {  }, child: const Text("Set Time",
      style: TextStyle(
          color: primaryDark,
          fontSize: 17,
          fontWeight: FontWeight.bold
      ),
    ),

    );
  }
}
