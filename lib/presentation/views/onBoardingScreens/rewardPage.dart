import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../widgets/streakGrid.dart';

class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              height: defaultSpacing * 2,
            ),
            Image(
              image: AssetImage("images/achieverCup.png"),
              height: 200,
              width: 200,
            ),
            //text
            Text("You are a SuperStar",
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: defaultSpacing * 2)),
            SizedBox(height: defaultSpacing / 2),
            Padding(
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
            StreakGrids()
          ],
        ),
      ),
    );
  }
}
