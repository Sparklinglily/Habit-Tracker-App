import 'package:flutter/material.dart';
import '../../../../../styles/constants.dart';

class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Achievements",
          style: TextStyle(
              color: fontDark,
              fontSize: defaultSpacing * 1.4,
              fontWeight: FontWeight.w500),
        ),
        Text(
          "See all",
          style: TextStyle(
              color: secondaryDark,
              fontSize: defaultSpacing,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
