import 'package:flutter/material.dart';

import 'package:habit_help/presentation/views/components/streakGrid.dart';

class ProgressPage extends StatelessWidget {
  final List<StreakGridData> eachGrid = [
    StreakGridData(
        LargeNum: '1',
        color: const Color.fromARGB(255, 248, 238, 247),
        miniText: 'You have missed:',
        days: 'day'),
    StreakGridData(
        LargeNum: '15',
        days: 'days',
        color: const Color.fromARGB(255, 210, 211, 246),
        miniText: 'You have completed:'),
    StreakGridData(
        LargeNum: '1400',
        color: const Color.fromARGB(255, 223, 241, 223),
        miniText: 'Streaks acquired:'),
    StreakGridData(
        LargeNum: '100',
        color: const Color.fromARGB(255, 248, 247, 238),
        miniText: 'Streaks lost:'),
    StreakGridData(
        LargeNum: '3/7',
        color: const Color.fromARGB(255, 248, 238, 247),
        miniText: 'This week\'s target:'),
    StreakGridData(
        LargeNum: '15/31',
        color: const Color.fromARGB(255, 223, 241, 223),
        miniText: 'This month\'s target:'),
  ];
  ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_outlined))),
              SizedBox(height: 22),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Image.asset(
                      'images/Ellipse.png',
                      height: 150,
                      width: 150,
                    ),
                    Positioned(
                        right: 5,
                        left: 5,
                        bottom: 40,
                        child: Image.asset(
                          'images/smiley.png',
                          height: 70,
                          width: 70,
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Congratulations!!!',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const Text(
                'You are 75% into achieving your goals, you can do this.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 800,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: null,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 6.0,
                        //formerly 12
                        childAspectRatio: 16 / 13,
                      ),
                      itemCount: eachGrid.length,
                      itemBuilder: (context, index) {
                        return StreakGrids(gridItem: eachGrid[index]);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
