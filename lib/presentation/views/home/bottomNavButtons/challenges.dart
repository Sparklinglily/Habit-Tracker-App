import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class Challenges extends StatefulWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Hello there, ready for some challenge?'),
      ),
    );
  }
}
