import 'package:flutter/material.dart';
import '../../styles/constants.dart';
import 'package:habit_help/presentation/views/MainScreens/bottomNavButtons/Home/homeScreen.dart';
import 'package:habit_help/presentation/views/MainScreens/bottomNavButtons/Home/homePage.dart';

class ProceedToHomePage extends StatefulWidget {
  const ProceedToHomePage({Key? key}) : super(key: key);

  @override
  State<ProceedToHomePage> createState() => _ProceedToHomePageState();
}

class _ProceedToHomePageState extends State<ProceedToHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: defaultSpacing * 9,
          ),
          Center(
            child: Text("Congratulations",
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: defaultSpacing * 3)),
          ),
          Center(
            child: Text(
              "Youre set to explore habit App",
              style: TextStyle(
                  color: secondaryLight,
                  height: 1.8,
                  fontWeight: FontWeight.w500,
                  fontSize: defaultSpacing * 1.3),
            ),
          ),
          Image(
            image: AssetImage(
              "images/achievement.png",
            ),
          ),
          SizedBox(height: defaultSpacing * 2.8),
        ],
      ),
    );
  }
}
