import 'package:flutter/material.dart';
import '../../../../styles/constants.dart';
import 'package:habit_help/widgets/spactBtw.dart';

import '../../Wigets/dailyQuotes.dart';
import '../../Wigets/due.dart';
import '../../Wigets/imageGrid.dart';
import 'Rewards/rewards.dart';
import 'Rewards/rewardsList.dart';

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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              //FIRST

              const DailyQuotes(),
              const Padding(
                  padding: EdgeInsets.only(bottom: defaultSpacing * 1.6)),
              const DueToday(),
              const Padding(
                  padding: EdgeInsets.only(bottom: defaultSpacing / 5)),

              GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      childAspectRatio: 17 / 14,
                      crossAxisSpacing: 6),
                  itemCount: gridItems.length,
                  itemBuilder: (context, index) {
                    return ImageGrids(gridData: gridItems[index]);
                  }),

              const Padding(padding: EdgeInsets.only(bottom: defaultSpacing)),
              const Rewards(),
              const Padding(
                  padding: EdgeInsets.only(bottom: defaultSpacing / 3)),
              const RewardList(),
            ],
          ),
        ),
      ),
    );
  }
}
