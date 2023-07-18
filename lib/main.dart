import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/FirebaseAuthServices/authMethods.dart';
import 'package:habit_help/authentication/checkEmail.dart';
import 'package:habit_help/authentication/forgotPasswordPage.dart';
import 'package:habit_help/pages/home/homeScreen.dart';
import 'package:habit_help/authentication/loginPage.dart';
import 'package:habit_help/profile/profilePage.dart';
import 'package:habit_help/screens/onboardingPages/loginOrSignUpPage.dart';
import 'package:habit_help/screens/onboardingPages/onboardOne.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:habit_help/authentication/signUpPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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
        home:  AuthWrapper(),
          debugShowCheckedModeBanner: false,

        routes: {
          "/profile": (context)=> ProfilePage(),
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







