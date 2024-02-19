import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';
import 'package:habit_help/presentation/views/Favorites/grid_items.dart';

class Favorites extends StatelessWidget {
  final List<GridItemData> gridItemData = [
    GridItemData(
        onTapped: () {},
        color: const Color.fromARGB(255, 239, 236, 231),
        image: ('images/plateOfFruits.jpg'),
        miniTitle: '20 people',
        title: 'Fruity 30 days'),
    GridItemData(
        onTapped: () {},
        color: const Color.fromARGB(255, 245, 232, 246),
        image: ('images/trackRun.jpg'),
        miniTitle: 'Run 1km',
        title: '12 people'),
    GridItemData(
        onTapped: () {},
        color: const Color.fromARGB(255, 230, 238, 244),
        image: ('images/yoga2.jpeg'),
        miniTitle: '10 people',
        title: 'Lets do yoga'),
    GridItemData(
        onTapped: () {},
        color: const Color.fromARGB(255, 248, 247, 230),
        image: ('images/mediatation.png'),
        miniTitle: '8 people',
        title: '30 days meditation'),
    GridItemData(
        onTapped: () {},
        color: const Color.fromARGB(255, 238, 238, 248),
        image: ('images/readingAbOOK.png'),
        miniTitle: '10 people',
        title: 'Readers are leaders'),
    GridItemData(
        onTapped: () {},
        color: const Color.fromARGB(255, 243, 251, 244),
        image: ('images/water.png'),
        miniTitle: '8 people',
        title: 'Drink water'),
    GridItemData(
        onTapped: () {},
        color: const Color.fromARGB(255, 248, 247, 230),
        image: ('images/mediatation.png'),
        miniTitle: '8 people',
        title: '30 days meditation'),
    GridItemData(
        onTapped: () {},
        color: const Color.fromARGB(255, 248, 247, 230),
        image: ('images/mediatation.png'),
        miniTitle: '8 people',
        title: '30 days meditation'),
  ];

  Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 204, 204),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Close',
                    style: TextStyle(color: primaryLight, fontSize: 16),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: SizedBox(
              height: 700,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 6.0,
                    childAspectRatio: 15 / 15,
                  ),
                  itemCount: gridItemData.length,
                  itemBuilder: (context, index) {
                    return GridItem(
                      gridData: gridItemData[index],
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
