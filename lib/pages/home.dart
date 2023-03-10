import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:habit_help/widgets/spactBtw.dart';

import '../widgets/dailyQuotes.dart';
import '../widgets/due.dart';
import '../widgets/imageGrid.dart';
import '../widgets/rewards.dart';
import '../widgets/rewardsList.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            //FIRST
            Padding(padding: EdgeInsets.only(bottom: defaultSpacing -4 )),
            DailyQuotes(),
            Padding(padding: EdgeInsets.only(bottom: defaultSpacing * 1.6)),
            DueToday(),
            Padding(padding: EdgeInsets.only(bottom: defaultSpacing / 7)),
            ImageGrids(),
            Padding(padding: EdgeInsets.only(bottom: defaultSpacing )),
            Rewards(),
            Padding(padding: EdgeInsets.only(bottom: defaultSpacing /3 )),
            RewardList(),

          ],
        ),
      ),
    );
  }
}
