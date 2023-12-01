import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/authentication/authMethods.dart';
import 'package:habit_help/presentation/views/authentication/checkEmail.dart';
import 'package:habit_help/presentation/views/authentication/forgotPasswordPage.dart';
import 'package:habit_help/presentation/views/home/homeScreen.dart';
import 'package:habit_help/presentation/views/authentication/loginPage.dart';
import 'package:habit_help/presentation/views/profile/profilePage.dart';
import 'package:habit_help/presentation/views/onBoardingScreens/onboardingPages/loginOrSignUpPage.dart';
import 'package:habit_help/presentation/views/onBoardingScreens/onboardingPages/onboardOne.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:habit_help/presentation/views/authentication/signUpPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'presentation/views/chat/screen/chatHome.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'presentation/views/invite/invitePage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // init hive
  await Hive.initFlutter();

  //oppen box
  var box = await Hive.openBox("lilybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods> (create: (_)=>FirebaseAuthMethods(FirebaseAuth.instance)
        ),
        StreamProvider(create: (context)=> context.read<FirebaseAuthMethods>().authState,
            initialData: null)

      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home:   AuthWrapper(),
          debugShowCheckedModeBanner: false,

        routes: {
          "/profile": (context)=> ProfilePage(),
          "/chat": (context)=> ChatHomePage(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null)
    {
         return HomePage();}
      else
        {
          return LoginPage();
        }
    }
  }







