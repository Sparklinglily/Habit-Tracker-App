import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_help/presentation/styles/constants.dart';
import 'package:habit_help/presentation/views/MainScreens/bottomNavButtons/Habit/habit_details_page.dart';
import 'package:habit_help/presentation/views/MainScreens/bottomNavButtons/Habit/addHabitPage.dart';

class HabitTab extends StatelessWidget {
  final String image;
  final Color? buttonColor;
  final String buttonText;
  void Function()? onTap;
  HabitTab(
      {required this.image,
      required this.buttonText,
      required this.onTap,
      this.buttonColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.sizeOf(context);
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: InkWell(
              onTap: onTap,
              child: Container(
                // width: size.height,
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                decoration: BoxDecoration(
                    color: buttonColor, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OngoingHabitTab extends StatelessWidget {
  const OngoingHabitTab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 7,
                childAspectRatio: 20 / 15.5),
            itemBuilder: (context, index) {
              return HabitTab(
                buttonColor: const Color.fromARGB(255, 237, 124, 19),
                image: 'assets/image5.jpg',
                buttonText: 'Drink water',
                onTap: () {
                  Get.to(() => HabitDetailsPage());
                },
              );
            },
            itemCount: 4,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              Get.to(() => AddHabitPage());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 223, 210),
                  borderRadius: BorderRadius.circular(8)),
              height: size.width * 0.3,
              width: size.width * 0.43,
              child: const Icon(
                Icons.add,
                size: 100,
                color: Color.fromARGB(255, 243, 208, 173),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CompletedHabitTab extends StatelessWidget {
  const CompletedHabitTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 7,
            childAspectRatio: 20 / 15.5),
        itemBuilder: (context, index) {
          return HabitTab(
            buttonColor: const Color.fromARGB(255, 43, 106, 45),
            image: 'assets/image2.jpg',
            buttonText: 'Run 10km',
            onTap: () {},
          );
        },
        itemCount: 4,
      ),
    );
  }
}
