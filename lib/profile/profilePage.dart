import 'package:flutter/material.dart';
import 'package:habit_help/profile/tabCards.dart';
import '../constants/constants.dart';

class ProfilePage extends StatefulWidget  {


   ProfilePage({
     Key?key,
     }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();


}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState(){
  super.initState();
  _tabController = TabController(length: 3, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:


          //Euclidean Modulo: %

      //truncating division operator: ~/
          //used nested scrollview so that the header wont
      // be scrollable but the tabContents will be
      DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)=>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver:

          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            collapsedHeight: 280,


            flexibleSpace: FlexibleSpaceBar(
              background:  Container(
                color: background,
                child: Column(
                    children:  [
                      Stack(
                        children: [
                          SizedBox(
                            height: 180,
                            width: 400,
                            child: Image.asset("images/header.png"),
                          ),

                          Positioned(
                              left: 155,
                              top: 88,
                              child: CircleAvatar(
                                radius: 43,
                                backgroundImage: AssetImage("images/profileImage.jpg") ,
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: Column(
                          children: [
                            Text("Mary Peters",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Text("Live healthy and enjoy life",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: Colors.blueGrey)),

                            SizedBox(height: 13,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 45,
                                  child: TextButton(onPressed:(){},style: TextButton.styleFrom(
                                    backgroundColor: primaryDark,
                                    foregroundColor: Colors.white,

                                  ),
                                      child: Text("Invite",style: TextStyle(fontSize: 15,),)),
                                ),
                                SizedBox(width: 9,),
                                SizedBox(
                                  width: 120,
                                  height: 45,
                                  child: OutlinedButton(onPressed: (){},style: ButtonStyle(
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(side:
                                      BorderSide(color: primaryLight,width: 1,),borderRadius: BorderRadius.circular(4))
                                      )

                                  ),
                                      child: Text("Chat",style: TextStyle(fontSize: 15))


                                  ),
                                )
                              ],
                            )

                          ],
                        ),

                      ),
                      SizedBox(height: 25,),


                    ]

                ),

              ),



            ),


          ),

          ),
                
                TabBar(


                  // isScrollable: true,

                  // indicator: BoxDecoration(
                  //   border: Border(
                  //     bottom: BorderSide(
                  //       color: primaryDark,
                  //     )
                  //   ),
                  // ),


                    indicatorColor: primaryDark,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,

                    tabs: [
                      Text("Achievement",style: TextStyle(
                          color: fontDark,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                      ),),
                      Text("Leaderboard",style: TextStyle(
                          color: fontDark,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                      ),),
                      Text("Challenges",style: TextStyle(
                          color: fontDark,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                      ),),


                    ]


                )



              
      ],
       body: TabBarView(
            controller: _tabController,
          children: [
            AchievementBoard(),


             AchievementBoard(),


          ChallengesBoard(),



          ],

      )
          //physics: NeverScrollableScrollPhysics(),





        ),
      ),



    );
  }
}
class _TabBarDelegate extends SliverPersistentHeaderDelegate{

  final TabBar _tabBar;
  _TabBarDelegate ( {required TabBar  tabBar}) : _tabBar = tabBar;

  @override
  Widget build(BuildContext context,
      double shrinkOffset,
      bool overlapsContent) {
    return Container(
      color: background,
      child: Column(
        children: [
          _tabBar,
        ],
      ),
    );
  }
  @override
  double get maxExtent =>_tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }}




class AchievementBoard extends StatelessWidget {
  const AchievementBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [

          //   child: ListTile(
          //     leading:
          //     CircleAvatar(
          //       backgroundImage: AssetImage("images/water.png"),
          //       radius: 23,
          //
          //     ),
          //     title:
          //     Text("Drink water challenge"),
          //
          //     trailing: Icon(Icons.star,color: primaryLight,size: 25,),
          //     subtitle: Text("5000 streaks"),
          //   ),
          // ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.height * .42,
            decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color:fontLight,
                      offset: Offset(1,2)
                  )
                ]
            ),
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage("images/sleeping2.jpg"),
                radius: 23,

              ),
              title:
              Text("Got enough sleep"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("5000 streaks"),
            ),
          ), SizedBox(height: 7,),

          Container(
            height: 80,
            width: MediaQuery.of(context).size.height * .42,
            decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color:fontLight,
                      offset: Offset(1,2)
                  )
                ]
            ),
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage("images/mango.jpg"),
                radius: 23,

              ),
              title:
              Text(" Ate fruits strictly for a week"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("4000 streaks"),
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.height * .42,
            decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color:fontLight,
                      offset: Offset(1,2)
                  )
                ]
            ),
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage(
                    "images/trackRun.jpg"),
                radius: 23,

              ),
              title:
              Text("Ran 10km daily"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("2500 streaks"),
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.height * .42,
            decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color:fontLight,
                      offset: Offset(1,2)
                  )
                ]
            ),
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage("images/waterhold.jpg"),
                radius: 23,

              ),
              title:
              Text("Drank 2 Litres of water daily"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("3500 streaks"),
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.height * .42,
            decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color:fontLight,
                      offset: Offset(1,2)
                  )
                ]
            ),
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage("images/waterhold.jpg"),
                radius: 23,

              ),
              title:
              Text("Drank 2 Litres of water daily"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("3500 streaks"),
            ),
          ),
        ],


      ),
    );



  }
}

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [

          Card(
            elevation: 3,
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage("images/water.png"),
                radius: 23,

              ),
              title:
              Text("Drink water challenge"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("Rank: 1st"),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage("images/pineapple.png"),
                radius: 23,

              ),
              title:
              Text("Eat A fruit"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("Rank: 2nd"),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage(
                    "images/readingAbOOK.png"),
                radius: 23,

              ),
              title:
              Text("Read a book"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("Rank: 2nd"),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage("images/yoga.png"),
                radius: 23,

              ),
              title:
              Text("Yoga Streak"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("Rank: 3rd"),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              leading:
              CircleAvatar(
                backgroundImage: AssetImage("images/readingAbOOK.png"),
                radius: 23,

              ),
              title:
              Text("planted 3 flowers"),

              trailing: Icon(Icons.star,color: primaryLight,size: 25,),
              subtitle: Text("Rank: 3rd"),
            ),
          ),


        ],
      ),
    );

    ;
  }
}


class ChallengesBoard extends StatelessWidget {
  const ChallengesBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15.0),
          child: Container(

            height: 200,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/water4.jpg"),
                fit: BoxFit.fill
              ),
              border: Border.all(width: 1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)
                  ,bottom: Radius.circular(5))
            ),


          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Water cleanses",style: TextStyle(
                  color: fontDark,
                  fontWeight: FontWeight.w500,
                  fontSize: 17
              ),),
              SizedBox(width: 165,),

              Icon(Icons.dark_mode_sharp),

              Text("30 days",style: TextStyle(
              color: secondaryLight,
              fontWeight: FontWeight.w400,
                  fontSize: 17
              ),)


            ],
          ),
          
          
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.people_alt_sharp,color: primaryDark,size: 29,),
              Text("12 people",style: TextStyle(
                  color: secondaryLight,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
              // SizedBox(height: 5,)




            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15.0),
          child: Container(

            height: 200,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/plateOfFruits2.jpg"),
                    fit: BoxFit.fill
                ),
                border: Border.all(width: 1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)
                    ,bottom: Radius.circular(5))
            ),


          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Water cleanses",style: TextStyle(
                  color: fontDark,
                  fontWeight: FontWeight.w500,
                  fontSize: 17
              ),),
              SizedBox(width: 165,),

              Icon(Icons.dark_mode_sharp),

              Text("30 days",style: TextStyle(
                  color: secondaryLight,
                  fontWeight: FontWeight.w400,
                  fontSize: 17
              ),)


            ],
          ),


        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.people_alt_sharp,color: primaryDark,size: 29,),
              Text("12 people",style: TextStyle(
                  color: secondaryLight,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
              // SizedBox(height: 5,)




            ],
          ),
        ),

      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}



