import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';
import 'package:habit_help/presentation/views/MainScreens/bottomNavButtons/Habit/Widgets/habitDetailsTile.dart';

class HabitDetailsPage extends StatefulWidget {
  const HabitDetailsPage({super.key});

  @override
  State<HabitDetailsPage> createState() => _HabitDetailsPageState();
}

class _HabitDetailsPageState extends State<HabitDetailsPage> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: size.width * 0.6,
                width: size.height * 0.47,
                decoration: const BoxDecoration(
                  //color: Color.fromARGB(255, 248, 238, 247),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(120),
                      bottomLeft: Radius.circular(120.0)),
                ),
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer, // Add this line
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(120),
                    bottomLeft: Radius.circular(120.0),
                  ),
                  child: Image.asset(
                    'images/waterhold.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const HabitDetailsTile(
                title: 'Title',
                subTitle: 'drink water',
                icon: Icon(
                  Icons.edit,
                  color: primaryDark,
                  size: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: 110,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 239, 235),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            'Duration',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '10 mins',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 110,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 239, 235),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            'Frequency',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Daily',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 110,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 239, 235),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            'Days',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2 months',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const HabitDetailsTile(
                  title: 'Start Date', subTitle: '18th July,2022'),
              const SizedBox(
                height: 15,
              ),
              const HabitDetailsTile(
                title: 'End Date',
                subTitle: '31st September,2022',
                icon: Icon(
                  Icons.edit,
                  color: primaryDark,
                  size: 16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              HabitDetailsTile(
                title: 'Remind Me',
                subTitle: '7am Daily',
                switchButton: CupertinoSwitch(
                  activeColor: primaryDark,
                  onChanged: (value) {
                    setState(() {
                      status = value;
                    });
                  },
                  value: status,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}