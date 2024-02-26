import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: const Color(0xFFFAFAFA),
            flexibleSpace: const Column(
              children: [
                TabBar(
                  tabs: [
                    Text(
                      "Ongoing",
                      style: TextStyle(
                          color: fontDark,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 21),
                    ),
                    Text(
                      "Completed",
                      style: TextStyle(
                          color: fontDark,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 24),
                    )
                  ],
                  indicatorColor: primaryLight,
                  indicatorSize: TabBarIndicatorSize.label,
                )
              ],
            ),
            elevation: 0,
          ),
          body: const TabBarView(children: [Text('bgfnm'), Text('bgfnm')]),
        ));
  }
}
