import 'package:flutter/material.dart';
import '../core/constants/constants.dart';


class DueToday extends StatefulWidget {
  const DueToday({Key? key}) : super(key: key);

  @override
  State<DueToday> createState() => _DueTodayState();
}

class _DueTodayState extends State<DueToday> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Due for today",style: TextStyle(
              color: fontDark,
              fontSize: defaultSpacing * 1.4,
              fontWeight: FontWeight.w500),
          ),

      Text("See all",style: TextStyle(
      color: secondaryDark,
      fontSize: defaultSpacing,
      fontWeight: FontWeight.w400),
      ),

        ],

      ),
    );
  }
}
