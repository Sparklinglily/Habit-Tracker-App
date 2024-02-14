import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';
import 'package:habit_help/presentation/views/chat/chatService/chatService.dart';
import 'package:habit_help/presentation/views/chat/components/chatBubble.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;
  const ChatPage(
      {Key? key, required this.receiverUserEmail, required this.receiverUserId})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    //only send message if there is somthing to be sent
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserId, _messageController.text);
      //CLeAR TEXTController after sending
      _messageController.clear();

      //cle
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          //messages
          Expanded(
            child: _buildMessageList(),
          ),
          //user input
          _buildMessageInput(),

          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  //build messagelist
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chat_rooms")
            .doc("chatRoomId")
            .collection("messages")
            // .orderBy("timestamp",descending: false)
            .snapshots(),
        // _chatService.getMessages(
        //     widget.receiverUserId, _firebaseAuth.currentUser!.uid
        //),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("oops");

            //return Text("Error${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("yayyy");
            //return Text("Loading..");
          }
          //  print(snapshot.data!.docs);

          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

//build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    //aalign the message to the right if the sender is the currnet user else align to the left
    var alignment = (data["senderId"] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(data["senderEmail"]),
            const SizedBox(
              height: 4,
            ),
            ChatBubble(message: (data["message"])),
          ],
        ));
  }

//build messageInput
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          //textfield
          Expanded(
              child: TextField(
            obscureText: false,
            controller: _messageController,
            decoration: const InputDecoration(
              fillColor: accent,
              hintText: " Input Message",
            ),
          )),
          //send button
          IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.send_rounded,
                size: 70,
              ))
        ],
      ),
    );
  }
}
