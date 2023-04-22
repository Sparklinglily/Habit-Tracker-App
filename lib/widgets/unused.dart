

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