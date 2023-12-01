import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Message {
 final String senderId;
  // String image;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;



  Message({
    required this.senderId,
    // required this.image,
    required this.senderEmail,
    required this. receiverId,
    required this.message,
    required this.timestamp,

  });

  // factory Message.fromJson(Map<String, dynamic> json) =>
  //     Message(
  //       senderId: json["userId"],
  //       // image: json["image"],
  //       senderEmail: json["senderEmail"],
  //       receiverId: json["receiverId"],
  //       message: json["message"],
  //       timestamp: json["timestamp"],
  //
  //     );
//convert to map
  Map<String, dynamic> toMap() {
    return {
      "userId": senderId,
      // "image": image,
      "senderEmail": senderEmail,
      "receiverId": receiverId,
      "message": message,
      "timestamp": timestamp,

    };

      }
}




