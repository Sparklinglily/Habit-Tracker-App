import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_help/presentation/styles/constants.dart';
import 'package:habit_help/presentation/views/Profile/Widgets/customTiles.dart';

import 'package:habit_help/presentation/views/chat/screen/chatHome.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            ///Header
            Container(
              color: background,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.206,
                        width: size.width,
                        child: Image.asset("images/header.png"),
                      ),
                      const Positioned(
                          left: 160,
                          top: 90,
                          child: CircleAvatar(
                            radius: 36,
                            backgroundImage:
                                AssetImage("images/profileImage.jpg"),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Text(
                          "Mary Peters",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Live healthy and enjoy life",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey)),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 45,
                              child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: primaryDark,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text(
                                    "Invite",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            SizedBox(
                              width: 120,
                              height: 45,
                              child: OutlinedButton(
                                onPressed: () {
                                  Get.to(() => const ChatHomePage());
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: primaryLight,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Chat",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const TabBar(
              isScrollable: true,
              indicatorColor: primaryDark,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: [
                Text(
                  "Achievement",
                  style: TextStyle(
                      color: fontDark,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Text(
                  "Leaderboard",
                  style: TextStyle(
                      color: fontDark,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Text(
                  "Challenges",
                  style: TextStyle(
                      color: fontDark,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: TabBarView(
                  //physics: NeverScrollableScrollPhysics(),
                  children: [
                    AchievementBoard(),
                    LeaderBoard(),
                    ChallengesBoard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementBoard extends StatelessWidget {
  const AchievementBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const ProfilePageTiles(
              color: Color.fromARGB(255, 224, 239, 246),
              title: 'Got enough sleep',
              subtitle: '5000 streaks',
              image: AssetImage('images/sleeping2.jpg'),
              icon: Icon(
                Icons.star,
                size: 24,
                color: primaryLight,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 22,
        ),
      ),
    );
  }
}

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 15,
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) {
            return const LeaderboardTile(
                image: AssetImage('images/water2.jpg'),
                rank: 'Rank: 1st  ',
                icon: Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 13,
                ),
                title: 'Drink water challenge');
          },
        ),
      ),
    );
  }
}

class ChallengesBoard extends StatelessWidget {
  const ChallengesBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ChallengeListTile(
                challengeTitle: 'Water is life',
                image: 'images/water4.jpg',
                numberOfDays: '30 days',
                numberOfDaysIcon: Icon(
                  Icons.dark_mode_rounded,
                  color: primaryDark,
                  size: 20,
                ),
                numberOfPeople: '12 people',
                peopleIcon: Icon(
                  Icons.people_alt_rounded,
                  color: primaryDark,
                  size: 20,
                ),
              );
            },
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 13,
                )),
            itemCount: 3),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfileView(),
  ));
}
