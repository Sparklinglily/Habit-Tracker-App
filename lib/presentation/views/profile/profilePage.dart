import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:habit_help/presentation/views/chat/components/customTiles.dart';
import 'package:habit_help/presentation/views/chat/screen/chatHome.dart';
import 'package:habit_help/presentation/views/profile/tabCards.dart';
import '../../styles/constants.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return DefaultTabController(
        //initialIndex: 0,
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
              return <Widget>[
                SliverAppBar(
                    // expandedHeight: 100,
                    pinned: true,
                    collapsedHeight: 230,
                    floating: true,
                    bottom: const TabBar(
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
                    flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                            color: background,
                            child: Column(children: [
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
                                        backgroundImage: AssetImage(
                                            "images/profileImage.jpg"),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  child: Column(children: [
                                const Text(
                                  "Mary Peters",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)))),
                                          child: const Text("Chat",
                                              style: TextStyle(fontSize: 15))),
                                    )
                                  ],
                                ),
                              ]))
                            ])))),
              ];
            },
            body: const Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: TabBarView(
                children: [
                  AchievementBoard(),
                  LeaderBoard(),
                  ChallengesBoard(),
                ],
              ),
            ),
          ),
        ));
  }
}

class AchievementBoard extends StatelessWidget {
  const AchievementBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          ProfilePageTiles(
              color: Color.fromARGB(255, 224, 239, 246),
              title: 'Got enough sleep',
              subtitle: '5000 streaks',
              image: AssetImage('images/sleeping2.jpg'),
              icon: Icon(
                Icons.star,
                size: 24,
                color: primaryLight,
              )),
          SizedBox(
            height: 20,
          ),
          ProfilePageTiles(
              color: Color.fromARGB(255, 246, 237, 224),
              title: 'Eat a fruit',
              image: AssetImage('images/pineapple.png'),
              subtitle: '4000 streaks',
              icon: Icon(
                Icons.star,
                size: 24,
                color: primaryLight,
              )),
          SizedBox(
            height: 20,
          ),
          ProfilePageTiles(
              color: Color.fromARGB(255, 255, 240, 245),
              subtitle: '2500 streaks',
              title: 'Run 10km daily',
              image: AssetImage('images/trackRun.jpg'),
              icon: Icon(
                Icons.star,
                size: 24,
                color: primaryLight,
              )),
          SizedBox(
            height: 20,
          ),
          ProfilePageTiles(
              color: Color.fromARGB(255, 236, 252, 236),
              subtitle: '3500 streaks',
              title: 'Drink 2 cups of water daily',
              image: AssetImage('images/waterhold.jpg'),
              icon: Icon(
                Icons.star,
                size: 24,
                color: primaryLight,
              ))
        ],
      ),
    );
  }
}

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          LeaderboardTile(
              image: AssetImage('images/water2.jpg'),
              rank: 'Rank: 1st  ',
              icon: Icon(
                Icons.star,
                color: Colors.white,
                size: 13,
              ),
              title: 'Drink water challenge'),
          SizedBox(
            height: 10,
          ),
          LeaderboardTile(
              image: AssetImage('images/readingAbOOK.png'),
              rank: 'Rank: 1st  ',
              icon: Icon(
                Icons.star,
                size: 13,
                color: Colors.white,
              ),
              title: 'Read a book'),
          SizedBox(
            height: 10,
          ),
          LeaderboardTile(
              image: AssetImage('images/yoga4.jpg'),
              rank: 'Rank: 1st  ',
              icon: Icon(
                Icons.star,
                size: 13,
                color: Colors.white,
              ),
              title: 'Do yoga'),
          SizedBox(
            height: 10,
          ),
          LeaderboardTile(
              image: AssetImage('images/pineapple.png'),
              rank: 'Rank: 1st  ',
              icon: Icon(
                Icons.star,
                size: 13,
                color: Colors.white,
              ),
              title: 'Eat a fruit'),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class ChallengesBoard extends StatelessWidget {
  const ChallengesBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 8, right: 15.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("images/water4.jpg"), fit: BoxFit.fill),
                  border: Border.all(width: 1),
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30), bottom: Radius.circular(5))),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Water cleanses",
                  style: TextStyle(
                      color: fontDark,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                SizedBox(
                  width: 165,
                ),
                Icon(Icons.dark_mode_sharp),
                Text(
                  "30 days",
                  style: TextStyle(
                      color: secondaryLight,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.people_alt_sharp,
                  color: primaryDark,
                  size: 29,
                ),
                Text("12 people",
                    style: TextStyle(
                        color: secondaryLight,
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
                // SizedBox(height: 5,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("images/plateOfFruits2.jpg"),
                      fit: BoxFit.fill),
                  border: Border.all(width: 1),
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30), bottom: Radius.circular(5))),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Water cleanses",
                  style: TextStyle(
                      color: fontDark,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                SizedBox(
                  width: 165,
                ),
                Icon(Icons.dark_mode_sharp),
                Text(
                  "30 days",
                  style: TextStyle(
                      color: secondaryLight,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.people_alt_sharp,
                  color: primaryDark,
                  size: 29,
                ),
                Text("12 people",
                    style: TextStyle(
                        color: secondaryLight,
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
                // SizedBox(height: 5,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
