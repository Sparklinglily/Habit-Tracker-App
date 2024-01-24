import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chatPage.dart';

class ChatHomePage extends StatefulWidget {
  ChatHomePage({Key? key}) : super(key: key);
  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
// auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // TextEditingController searchController = TextEditingController();
  // List<Map> searchResults = [];
  // bool isLoading = false;
  //
  //
  //
  // void onSearch() async{
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        // toolbarHeight: 150,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Padding(
              padding: EdgeInsets.only(bottom: 68.0),
              child: Icon(Icons.arrow_back_ios, size: 24, color: Colors.white),
            )),
        title: const Center(
            // child: Column(
            //   children: [
            //     const Align(alignment: AlignmentDirectional.topStart,
            //         child: Text("Messages",style: TextStyle(fontSize: 25,color: Colors.white),)),
            //     Padding(padding: EdgeInsets.only(bottom: 12)),
            //     Padding(
            //       padding: const EdgeInsets.only(right:38.0),
            //       child: TextField(
            //         cursorColor: Colors.black,
            //           decoration: InputDecoration(
            //             filled: true,
            //             fillColor: Colors.white,
            //               //label: Icon(Icons.arrow_back_ios,color: Colors.white),
            //
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(15),
            //               ),
            //               hintText: "search friends"
            //           ),
            //         ),
            //     ),
            //   ],
            // ),
            ),
      ),
      body: _buildListOfUsers(),
      // SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(10),
      //     child: Container(
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: 5,
      //             itemBuilder: (BuildContext context,int index){
      //             return  const Padding(
      //               padding: EdgeInsets.only(right: 15),
      //               child: SizedBox(
      //                   child: Column(
      //                     children: [
      //                       CircleAvatar(
      //                         backgroundImage: AssetImage(
      //                             "images/readingAbOOK.png"),
      //                         radius: 45,
      //
      //                       ),
      //                       Text("Readers are Leaders")
      //                     ],
      //                   ),
      //
      //                 ),
      //             )  ;
      //             }),
      //
      //
      //
      //     ),
      //   ),
      //
      //
      // ),
    );
  }

  //build a list of users except for the current logged in user.
  Widget _buildListOfUsers() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading..');
          }
          return ListView(
              children: snapshot.data!.docs
                  .map<Widget>((doc) => _buildUserListItem(doc))
                  .toList());
        });
  }

  //Build individual userList items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all users except current User
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['email']),
        onTap: () {
          //pass the cicked UID TO THE chat page
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        receiverUserEmail: data['email'],
                        receiverUserId: data['uid'],
                      )));
        },
      );
    }
    return Container();
  }
}
