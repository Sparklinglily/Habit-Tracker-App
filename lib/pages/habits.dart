import 'package:flutter/material.dart';
import '../constants/constants.dart';

class GridViewTab extends StatefulWidget {
  const GridViewTab({Key? key}) : super(key: key);

  @override
  State<GridViewTab> createState() => _GridViewTabState();
}

class _GridViewTabState extends State<GridViewTab> {

  List <String> pics = [

    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-Q7sDOUfHqXFWRCz2_S1rAfwMXA9EtbCdjA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJPqMslDlwM_DKFoTWwtIG8pD7kNxoywMdRg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3XP8FxcHHiX0v2PqEjIetQd1F-oxPriW36Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQwwD5k1VcEas0W_2QwWHL67DVpmHxxZhrFA&usqp=CAU",


  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 11.0),
      child: GridView.count(crossAxisCount: 2,
        mainAxisSpacing: 4,

        children: pics.map((image) {
          return Container(
            margin: EdgeInsets.all(11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),

            ),
            child: Image.network(image,
              fit: BoxFit.cover,),
          );


        }).toList(),
      ),

    );
  }
}




class Habits extends StatefulWidget {
  const Habits({Key? key}) : super(key: key);

  @override
  State<Habits> createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 2, child: Scaffold(
        appBar: AppBar(
          //instead of using an appBar that can be so wide
          // use a flexible space to reduce the space that the app bar occupies
          backgroundColor: const Color(0xFFFAFAFA),
          flexibleSpace: Column (
            mainAxisAlignment:MainAxisAlignment.end ,
            children: const [
              TabBar(tabs: [
                Text("Ongoing",
                  style: TextStyle(
                      color: fontDark,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 21
                  ),),

                Text("Completed",
                  style: TextStyle(
                      color: fontDark,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 21
                  ),)

              ],
                indicatorColor: primaryLight,
                indicatorSize: TabBarIndicatorSize.label,

              )

          ],

          ),
          elevation: 0,

        ),


        body: const TabBarView(children: [
          GridViewTab(),
          GridViewTab(),

        ],

        ),
      )),
    );
  }
}
