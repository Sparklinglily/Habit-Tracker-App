import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../pages/addHabitButton.dart';
import '../pages/challenges.dart';
import '../pages/habits.dart';
import '../pages/home.dart';
import '../pages/profilePage.dart';
import '../pages/tasks.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex= 0;

  final List<Widget> screens = [
    const Home(),
    const Habits(),
    const Tasks(),
    const Challenges(),
  ];

  void _onTabTapped(int index){
    setState(() {
      _currentIndex= index;
    });
  }

  final picture = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&usqp=CAU";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [


            CircleAvatar(
              radius: 19,
              backgroundImage: NetworkImage(picture),
            )

          ],
        ),
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
      ),

      //drawer should be  bellow the appbar
      drawer: SafeArea(
        child: Drawer(
              child: Column(
                children: [
                  DrawerHeader(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/oranges.jpg"),
                              fit: BoxFit.cover
                          )
                      ),

                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: defaultRadius *3,
                        backgroundImage: NetworkImage(picture),
                      ),
                      const SizedBox(height: 9,),
                      const Text("Sparkling Lily",
                      style: TextStyle(
                        color: background,
                        fontWeight: FontWeight.bold,
                        fontSize: defaultSpacing* 1.7
                      ),
                      )
                    ],
                  )
                  ),
                    const SizedBox(height: defaultSpacing*2,),

                    ListTile(
                      title: const Text("Profile",
                      style: TextStyle(
                          color: primaryDark,
                        fontSize: defaultSpacing * 1.3
                      ),),
                      leading: Icon(Icons.account_box_outlined,color: primaryDark,size: defaultSpacing*2,shadows: [
                        Shadow(
                          offset:
                          Offset(2.0, 2.0), //position of shadow
                          blurRadius: 6.0, //blur intensity of shadow
                          color: const Color.fromARGB(255, 153, 153, 153)
                              .withOpacity(
                              0.8)
                        )
                      ],),
                      onTap: () {
                        Navigator.pop(context,
                        MaterialPageRoute(builder: (context)=> const ProfilePage() ));
                      },
                    ),
                    //2
                    ListTile(
                      title: const Text("Favorites",
                        style: TextStyle(
                            color: primaryDark,
                            fontSize: defaultSpacing * 1.3
                        ),
                      ),
                      leading: Icon(Icons.favorite_outlined,color: primaryDark,size: defaultSpacing*2,shadows: [
                     Shadow(
                         offset:
                     const Offset(2.0, 2.0), //position of shadow
                  blurRadius: 6.0, //blur intensity of shadow
                 color: const Color.fromARGB(255, 153, 153, 153)
                        .withOpacity(
                             0.8)
                         )
                           ],),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    //3
                    ListTile(
                      title: const Text("Settings",
                        style: TextStyle(
                            color: primaryDark,
                            fontSize: defaultSpacing * 1.3
                        ),),
                      leading:Icon(Icons.settings,color: primaryDark,size: defaultSpacing*2,shadows: [
                    Shadow(
                    offset:
                    const Offset(2.0, 2.0), //position of shadow
                    blurRadius: 6.0, //blur intensity of shadow
                    color: const Color.fromARGB(255, 153, 153, 153)
                        .withOpacity(
                    0.8)
                    )
                    ],),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    //4
                    ListTile(
                      title: const Text("Contact Us",
                        style: TextStyle(
                            color: primaryDark,
                            fontSize: defaultSpacing * 1.3
                        ),),
                      leading:Icon(Icons.call,color: primaryDark,size: defaultSpacing*2,shadows: [
                  Shadow(
                  offset:
                  const Offset(2.0, 2.0), //position of shadow
                  blurRadius: 6.0, //blur intensity of shadow
                  color: const Color.fromARGB(255, 153, 153, 153)
                      .withOpacity(
                  0.8)
                  )
                  ],),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    //5
                    ListTile(
                      title: const Text("Log Out",
                      style:TextStyle(
                        color: primaryDark,
                    fontSize: defaultSpacing * 1.3
                    ),),
                      leading:Icon(Icons.favorite_outlined,color: primaryDark,size: defaultSpacing*2,shadows: [
                  Shadow(
                  offset:
                  const Offset(2.0, 2.0), //position of shadow
                  blurRadius: 6.0, //blur intensity of shadow
                  color: const Color.fromARGB(255, 153, 153, 153)
                      .withOpacity(
                  0.8)
                  )
                  ],),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
            ),
      ),

      //fgh
      body: screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: primaryLight, onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddHabit(),
        ));
      },
        foregroundColor: background,
        child: const Icon(Icons.add,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      bottomNavigationBar: BottomAppBar(

        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home , color : primaryLight,),
              onPressed: () {

                _onTabTapped(0);
              },
            ),
            IconButton(
              icon: const Icon(Icons.hexagon,color : primaryLight),
              onPressed: () {
                _onTabTapped(1);
              },
            ),
            IconButton(
              icon: const Icon(Icons.task,color : primaryLight),
              onPressed: () {
                _onTabTapped(2);
              },
            ),
            IconButton(
              icon: const Icon(Icons.flag,color : primaryLight),
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