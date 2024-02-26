import 'package:flutter/material.dart';
import '../../styles/constants.dart';
import '../components/streakGrid.dart';

class Achievement extends StatelessWidget {
  final List<StreakGridData> eachGrid = [
    StreakGridData(
        LargeNum: '0',
        miniText: 'You missed:',
        color: const Color.fromARGB(255, 248, 238, 247),
        days: 'day'),
    StreakGridData(
        LargeNum: '50',
        miniText: 'You completed:',
        color: const Color.fromARGB(255, 238, 203, 250),
        days: 'days'),
    StreakGridData(
      LargeNum: '5000',
      miniText: 'Streaks acquired:',
      color: const Color.fromARGB(255, 210, 211, 246),
    ),
    StreakGridData(
        LargeNum: '0',
        miniText: 'Streaks lost:',
        color: const Color.fromARGB(255, 245, 235, 199),
        days: 'day'),
  ];
  Achievement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            const SizedBox(
              height: defaultSpacing * 2,
            ),
            const Image(
              image: AssetImage("images/achieverCup.png"),
              height: 200,
              width: 200,
            ),
            //text
            Center(
              child: const Text("You are a SuperStar",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: defaultSpacing * 2)),
            ),
            const SizedBox(height: defaultSpacing / 2),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSpacing * 1.5),
              child: Text(
                "The great thing about completing a task "
                "is the feeling of accomplishment that comes with it."
                " You deserve to be celebrated.",
                style: TextStyle(
                    color: secondaryLight,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    fontSize: defaultSpacing * 1.2),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 500,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: null,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 6.0,
                    childAspectRatio: 16 / 12,
                  ),
                  itemCount: eachGrid.length,
                  itemBuilder: (context, index) {
                    return StreakGrids(gridItem: eachGrid[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
