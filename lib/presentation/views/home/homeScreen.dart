import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/Favorites/favorites.dart';
import 'package:habit_help/presentation/views/Settings/settingsPage.dart';
import 'package:habit_help/presentation/views/profile/profilePage.dart';
import '../../styles/constants.dart';
import '../addHabit/addHabitPage.dart';

import 'bottomNavButtons/challenges.dart';
import 'bottomNavButtons/habits.dart';
import 'homePage.dart';

import 'bottomNavButtons/tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../authentication/loginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> screens = [
    const Home(),
    const HabitsPage(),
    const Tasks(),
    const Challenges(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final picture =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&usqp=CAU";

  //to get user
  // final User? user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.to(() => LoginPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () {
                Get.to(() => ProfilePage());
              },
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(picture),
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
      ),

      //drawer should be  bellow the appbar
      drawer: SafeArea(
        child: Drawer(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/oranges.jpg"), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: defaultSpacing * 4,
                ),
                CircleAvatar(
                  radius: defaultRadius * 4,
                  backgroundImage: NetworkImage(picture),
                ),
                const SizedBox(
                  height: 9,
                ),
                const Text(
                  "Sparkling Lily",
                  style: TextStyle(
                      color: primaryDark,
                      fontWeight: FontWeight.bold,
                      fontSize: defaultSpacing * 1.7),
                ),

                const SizedBox(
                  height: defaultSpacing * 3,
                ),

                TextButton.icon(
                  onPressed: () {
                    Get.to(() => ProfilePage());
                  },
                  icon: Icon(
                    Icons.account_box_outlined,
                    color: primaryDark,
                    size: defaultSpacing * 3,
                    shadows: [
                      Shadow(
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 6.0,
                          color: const Color.fromARGB(255, 153, 153, 153)
                              .withOpacity(0.8))
                    ],
                  ),
                  label: const Text(
                    "Profile",
                    style: TextStyle(
                        color: primaryDark, fontSize: defaultSpacing * 1.7),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Get.to(() => Favorites());
                  },
                  icon: Icon(
                    Icons.favorite_outlined,
                    color: primaryDark,
                    size: defaultSpacing * 3,
                    shadows: [
                      Shadow(
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 6.0,
                          color: const Color.fromARGB(255, 153, 153, 153)
                              .withOpacity(0.8))
                    ],
                  ),
                  label: const Text(
                    "Favorites",
                    style: TextStyle(
                        color: primaryDark, fontSize: defaultSpacing * 1.7),
                  ),
                ),
                TextButton.icon(
                    onPressed: () {
                      Get.to(() => const SettingsPage());
                    },
                    icon: Icon(
                      Icons.settings,
                      color: primaryDark,
                      size: defaultSpacing * 3,
                      shadows: [
                        Shadow(
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 6.0,
                            color: const Color.fromARGB(255, 153, 153, 153)
                                .withOpacity(0.8))
                      ],
                    ),
                    label: const Text(
                      "Settings",
                      style: TextStyle(
                          color: primaryDark, fontSize: defaultSpacing * 1.7),
                    )),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call,
                      color: primaryDark,
                      size: defaultSpacing * 3,
                      shadows: [
                        Shadow(
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 6.0,
                            color: const Color.fromARGB(255, 153, 153, 153)
                                .withOpacity(0.8))
                      ],
                    ),
                    label: const Text(
                      "Contact Us",
                      style: TextStyle(
                          color: primaryDark, fontSize: defaultSpacing * 1.7),
                    )),

                //5
                TextButton.icon(
                  onPressed: signOut,
                  icon: Icon(
                    Icons.logout,
                    color: primaryDark,
                    size: defaultSpacing * 3,
                    shadows: [
                      Shadow(
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 6.0,
                          color: const Color.fromARGB(255, 153, 153, 153)
                              .withOpacity(0.8))
                    ],
                  ),
                  label: const Text(
                    "Log out",
                    style: TextStyle(
                        color: primaryDark, fontSize: defaultSpacing * 1.7),
                  ),
                )
              ],
            ),
          ),
        )),
      ),

      //fgh
      body: screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryLight,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddHabitPage(),
              ));
        },
        foregroundColor: background,
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                color: primaryLight,
              ),
              onPressed: () {
                _onTabTapped(0);
              },
            ),
            IconButton(
              icon: const Icon(Icons.hexagon, color: primaryLight),
              onPressed: () {
                _onTabTapped(1);
              },
            ),
            IconButton(
              icon: const Icon(Icons.task, color: primaryLight),
              onPressed: () {
                _onTabTapped(2);
              },
            ),
            IconButton(
              icon: const Icon(Icons.flag, color: primaryLight),
              onPressed: () {
                _onTabTapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
