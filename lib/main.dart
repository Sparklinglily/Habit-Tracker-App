import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:habit_help/presentation/views/MainScreens/bottomNavButtons/Habit/pogressGraph.dart';
import 'package:habit_help/presentation/views/addHabit/addHabitMethod.dart';
import 'package:habit_help/presentation/views/authentication/authMethods.dart';

import 'package:habit_help/presentation/views/MainScreens/bottomNavButtons/Habit/habits.dart';
import 'package:habit_help/presentation/views/MainScreens/bottomNavButtons/Home/homeScreen.dart';
import 'package:habit_help/presentation/views/authentication/loginPage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'presentation/views/chat/screen/chatHome.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

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
        //  ChangeNotifierProvider(create: (context) => HabitProvider()),
        Provider<FirebaseAuthMethods>(
            create: (_) => FirebaseAuthMethods(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        )
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const AuthWrapper(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/habits': (context) => const HabitsPage(),
          // '/completedHabits': (context) => const HabitsPage().completedHabits
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
    if (firebaseUser != null) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
