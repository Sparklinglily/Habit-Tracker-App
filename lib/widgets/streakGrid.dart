import 'package:flutter/material.dart';
import '../presentation/styles/constants.dart';

class StreakGrids extends StatefulWidget {
  const StreakGrids({Key? key}) : super(key: key);

  @override
  State<StreakGrids> createState() => _StreakGridsState();
}

class _StreakGridsState extends State<StreakGrids> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 9,
            crossAxisSpacing: 9,
            shrinkWrap: true,
            children: [
              GridTile(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: accent,
                ),
                child: const Center(
                  child: Text(
                    "You missed:\n 0 day",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              )),
//GRID2
              GridTile(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color(0xFFB2EBF2),
                ),
                child: const Center(
                  child: Text(
                    "You completed:\n 50days",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )),
//GRID 3
              GridTile(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFB2EBF2),
                ),
                child: const Center(
                  child: Text(
                    "Streaks acquired:\n 5000",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              )),
//GRID 4
              GridTile(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xFFE1BEE7),
                ),
                child: const Center(
                  child: Text(
                    "Streaks lost:\n 0",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
