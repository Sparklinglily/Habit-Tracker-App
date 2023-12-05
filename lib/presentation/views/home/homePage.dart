import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import 'package:habit_help/widgets/spactBtw.dart';

import 'Wigets/dailyQuotes.dart';
import 'Wigets/due.dart';
import 'Wigets/imageGrid.dart';
import '../../../widgets/rewards.dart';
import '../../../widgets/rewardsList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isClicked = false;
  final List<ImageGridData> imageGridItems = [
    ImageGridData(
        image: 'images/readingAbook.jpg',
        checkBox: Checkbox(value: null, onChanged: null),
        text: 'Read a book'),
    ImageGridData(
        image: 'images/eatingFruits.jpg',
        checkBox: Checkbox(value: null, onChanged: null),
        text: 'Eating a fruit'),
    ImageGridData(
        image: 'images/trackRace.jpg',
        checkBox: Checkbox(value: null, onChanged: null),
        text: 'Run 10km'),
    ImageGridData(
        image: 'images/sleeping.jpg',
        checkBox: Checkbox(value: null, onChanged: null),
        text: 'Read a book'),
    ImageGridData(
        image: 'images/readingAbook.png',
        checkBox: Checkbox(value: null, onChanged: null),
        text: 'Read a book'),
    ImageGridData(
        image: 'images/eatingFruits.jpg',
        checkBox: Checkbox(value: null, onChanged: null),
        text: 'Eating a fruit'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: const [
            //FIRST

            DailyQuotes(),
            Padding(padding: EdgeInsets.only(bottom: defaultSpacing * 1.6)),
            DueToday(),
            Padding(padding: EdgeInsets.only(bottom: defaultSpacing / 5)),

            Padding(padding: EdgeInsets.only(bottom: defaultSpacing)),
            Rewards(),
            Padding(padding: EdgeInsets.only(bottom: defaultSpacing / 3)),
            RewardList(),
          ],
        ),
      ),
    );
  }
}
