

/*return Drawer(
child: ListView(
padding: EdgeInsets.zero,
children: <Widget>[
DrawerHeader(
decoration: BoxDecoration(
color: Colors.blue,
),
child: Text(
'Twitter',
style: TextStyle(
color: Colors.white,
fontSize: 24,
),
),
),
ListTile(
leading: Icon(Icons.home),
title: Text('Home'),
onTap: () {
Navigator.pop(context);
// Add your code here to navigate to the Home screen
},
),
ListTile(
leading: Icon(Icons.notifications),
title: Text('Notifications'),
onTap: () {
Navigator.pop(context);
// Add your code here to navigate to the Notifications screen
},
),
ListTile(
leading: Icon(Icons.person),
title: Text('Profile'),
onTap: () {
Navigator.pop(context);
// Add your code here to navigate to the Profile screen
},
),
Divider(),

L
//ghjk
drawer: SafeArea(
child: Drawer(
child: Column(
children: [
DrawerHeader(
decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage("images/oranges.jpg"),
fit: BoxFit.cover

),
color: primaryDark,
),
child: ListTile(
title: Padding(
padding: const EdgeInsets.only(top: 20),
child: CircleAvatar(
backgroundImage: AssetImage('assets/baby1.png'),
radius: defaultSpacing * 3,
child: Text(
'96',
style: TextStyle(
fontSize: defaultSpacing * 2,
fontWeight: FontWeight.bold,
shadows: [
Shadow(
offset:
Offset(2.0, 2.0), //position of shadow
blurRadius: 6.0, //blur intensity of shadow
color: const Color.fromARGB(255, 153, 153, 153)
    .withOpacity(
0.8), //color of shadow with opacity
),

//add more shadow with different position offset here
],
color: secondaryLight),
),
))),
),
SizedBox(
height: defaultSpacing * 3,
),
ListTile(
leading: const Icon(
Icons.my_library_books,
size: 30,
),
title: const Text(
"Take APGAR Score",
style: TextStyle(fontSize: defaultSpacing),
),
),
ListTile(

leading: const Icon(Icons.data_exploration),
title: const Text(
"APGAR Database",
style: TextStyle(fontSize: defaultSpacing),
),
),
ListTile(

leading: const Icon(Icons.feedback),
title: const Text(
"Feedback",
style: TextStyle(fontSize: defaultSpacing),
),
),
Spacer(),
Padding(
padding: const EdgeInsets.only(left: defaultSpacing * 1.5),
child: ListTile(

leading: const Icon(
Icons.logout_outlined,
color: Colors.red,
),
title: const Text(
"Logout",
style:
TextStyle(fontSize: defaultSpacing, color: Colors.red),
),
),
)
],
),
),
),

///
///  IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back,size: 19,)),
///
///
/// appBar: AppBar(
//          backgroundColor: Colors.white,
//          elevation: 0,
//          actions: [
//            Row(
//              children: <Widget> [
//
//             TextButton(onPressed: () {},
//                 child: const Text("Save",
//             style: TextStyle(
//               fontSize: 21,
//               fontWeight: FontWeight.bold
//             ),
//                 )
//             )
//              ],
//            )
//          ],
//
//        ),


 IconButton(onPressed: () , icon: const Icon(Icons.menu_open) )
///
 Padding(
        padding: const EdgeInsets.fromLTRB(13,34,13,34),
        child: Column(
          children: [
            //ONGOING AND COMpLETED
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Ongoing",
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 21
                  ),),
                Text("Completed",
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 21
                  ),),
                // Divider(
                //   indent: 3,
                //   endIndent: 2,
                //   thickness: 3,
                //   color: fontLight,
                //   height: 6,
                //
                // )

              ],

            )

          ],
        ),
      ),

//grid views

Text(
                        'Already have an account ?',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: defaultSpacing, color: secondaryLight),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage(),
                        ));
                      },
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: defaultSpacing * 1.2,
                              color: secondaryLight,
                              fontWeight: FontWeight.bold,
                            ),
                          )






                      )


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
 */

//class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot){
//         if (snapshot.hasData){
//           return HomePage();
//         } else {
//           return const LoginPage();
//         }
//       }
//
//
//     ),
//
//   );
//
//   }

///
///                             // DrawerHeader(
//                             //     decoration: const BoxDecoration(
//                             //         image: DecorationImage(
//                             //             image: AssetImage("images/oranges.jpg"),
//                             //             fit: BoxFit.cover
//                             //         )
//                             //     ),
//                             //
//                             //     child: Column(
//                             //       mainAxisAlignment: MainAxisAlignment.center,
//                             //       // crossAxisAlignment: CrossAxisAlignment.start,
//                             //       children: [
//                             //         CircleAvatar(
//                             //           radius: defaultRadius *3,
//                             //           backgroundImage: NetworkImage(picture),
//                             //         ),
//                             //         const SizedBox(height: 9,),
//                             //         const Text("Sparkling Lily",
//                             //           style: TextStyle(
//                             //               color: background,
//                             //               fontWeight: FontWeight.bold,
//                             //               fontSize: defaultSpacing* 1.7
//                             //           ),
//                             //         )
//                             //       ],
//                             //     )
//                             //



///
/// import 'package:flutter/material.dart';
// import 'package:habit_help/pages/tasks.dart';
// import '../constants/constants.dart';
// import 'package:habit_help/widgets/saveButton.dart';
// import 'package:habit_help/widgets/setPrior.dart';
// import 'package:habit_help/widgets/setTime.dart';
//
//
//
//
// class AddNewTask extends StatefulWidget {
//   const AddNewTask({Key? key}) : super(key: key);
//
//   @override
//   State<AddNewTask> createState() => _AddNewTaskState();
// }
//
// class _AddNewTaskState extends State<AddNewTask> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(4,8,6,8),
//         child: ListView(
//           children: [
//             //appbar
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const Tasks(),
//                   ));
//
//                 } , icon: const Icon(
//                     Icons.arrow_back,size: 29,)),
//         const SaveButton(),
//               ],
//             ),
//             //rest of the body
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 13.0),
//               child: Text("Task name",
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 25,
//                 color: secondaryLight
//               ),),
//             ),
//             //row for set priority and time
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SetPriority(),
//                 SetTime()
//               ],
//             ),
//             const SizedBox(height: 18,),
//             //description
//
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text("Add description",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w600
//               ),),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               child: TextField(
//                 style: TextStyle(
//                   fontSize: 25,
//                 ),
//                 decoration: InputDecoration(
//                   // labelText: "Add description",
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: accent,
//                       width: 2.0
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(7.0)),
//                   ),
//                 ),
//                 maxLines: 3,
//
//               ),
//             ),
//             SizedBox(height: 19,),
//
//
//
//             //sub descrition
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text("Sub description",
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w600
//                 ),),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0),
//               child: TextField(
//                 style: TextStyle(
//                   fontSize: 25,
//                 ),
//                 decoration: InputDecoration(
//                   // labelText: "Add description",
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color: accent,
//                         width: 2.0
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(7.0)),
//
//
//                   ),
//
//
//                 ),
//                 maxLines: 11,
//
//               ),
//             ),
//
//
//
//
//
//
//
//
//           ],
//         ),
//       ),
//
//
//
//
//
//
//
//
//       // Column(
//       //   children: [
//       //     //SAVE AND BACK ICON
//       //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //       children: [
//       //
//       //
//       //
//       //
//       //       ],
//       //
//       //     )
//       //   ],
//       // ),
//
//     );
//   }
// }


//former task page
///
/// ody: Padding(
//           padding: const EdgeInsets.fromLTRB(15,35,15,35),
//           child: Column(
//             children: [
//              Container(
//                alignment: Alignment.topRight,
//                child:  ElevatedButton.icon(
//                  style: ElevatedButton.styleFrom(
//                      padding: EdgeInsets.all(7)),
//                  onPressed: (){},label: const Text("Create  New Task"),
//                  icon: Icon(Icons.add),
//
//                ),
//              ),
//
//                   //image
//               const Image(image: AssetImage("images/oopss.png"),
//                 height: 400,
//                 width: 500,
//
//               ),
//
//               //oops
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: defaultSpacing ),
//                 child: Text("Oops!! You have not added "
//                     "any new tasks for today. Add a new "
//                     "task to begin.",
//                     style: TextStyle(
//                       height: 1.5,
//                         fontWeight: FontWeight.w500,
//                         fontSize: defaultSpacing * 1.5
//                     )
//                 ),
//               ),
//
//
//
//
//
//             ],
//           ),
//         ),