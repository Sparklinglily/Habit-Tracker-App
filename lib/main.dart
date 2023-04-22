import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/screens/homeScreen.dart';
import 'package:habit_help/screens/loginPage.dart';
import 'package:habit_help/screens/loginButton.dart';
import 'package:habit_help/screens/onboardOne.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:habit_help/screens/signUpPage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:  const onboardingOne(),
        debugShowCheckedModeBanner: false,
    );
  }
}





