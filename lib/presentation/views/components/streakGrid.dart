import 'package:flutter/material.dart';
import '../../styles/constants.dart';

class StreakGridData {
  final String miniText;
  final String LargeNum;
  final Color color;
  final String days;
  StreakGridData(
      {required this.LargeNum,
      required this.color,
      required this.miniText,
      this.days = ''});
}

class StreakGrids extends StatelessWidget {
  final StreakGridData gridItem;
  const StreakGrids({required this.gridItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: gridItem.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            gridItem.miniText,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                gridItem.LargeNum,
                style: const TextStyle(fontSize: 55),
              ),
              Text(gridItem.days)
            ],
          )
        ],
      ),
    );
  }
}
