import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import 'package:habit_help/widgets/spactBtw.dart';

import 'Wigets/dailyQuotes.dart';
import 'Wigets/due.dart';
import 'Wigets/imageGrid.dart';
import 'Wigets/rewards.dart';
import 'Wigets/rewardsList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ImageGridData> gridItems = List.generate(
      6,
      (index) => ImageGridData(
          id: index,
          imagePath: 'assets/image${index % 5 + 1}.jpg',
          isChecked: false,
          title: 'run 10km'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              //FIRST

              DailyQuotes(),
              Padding(padding: EdgeInsets.only(bottom: defaultSpacing * 1.6)),
              DueToday(),
              Padding(padding: EdgeInsets.only(bottom: defaultSpacing / 5)),

              GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      childAspectRatio: 17 / 14,
                      crossAxisSpacing: 6),
                  itemCount: gridItems.length,
                  itemBuilder: (context, index) {
                    return ImageGrids(gridData: gridItems[index]);
                  }),

              Padding(padding: EdgeInsets.only(bottom: defaultSpacing)),
              Rewards(),
              Padding(padding: EdgeInsets.only(bottom: defaultSpacing / 3)),
              RewardList(),
            ],
          ),
        ),
      ),
    );
  }
}
