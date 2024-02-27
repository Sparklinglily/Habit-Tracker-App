import 'package:flutter/material.dart';
import '../../../styles/constants.dart';

class DueToday extends StatefulWidget {
  const DueToday({Key? key}) : super(key: key);

  @override
  State<DueToday> createState() => _DueTodayState();
}

class _DueTodayState extends State<DueToday> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Due for today",
            style: TextStyle(
                color: fontDark,
                fontSize: defaultSpacing * 1.1,
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
      ),
    );
  }
}
