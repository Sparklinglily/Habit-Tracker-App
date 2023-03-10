
import 'dart:async';

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:habit_help/screens/onboardingTwo.dart';


class onboardingOne extends StatefulWidget {
  const onboardingOne({Key? key}) : super(key: key);

  @override
  State<onboardingOne> createState() => _onboardingOneState();
}

class _onboardingOneState extends State<onboardingOne> {
  @override

  void initState(){
    super.initState();
      Timer(Duration(seconds: 3),
          ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
              (context)=>   onboardingTwo()
              )
          )
      );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: defaultSpacing,
          ),
           const Image(image: AssetImage("images/logo.png"),
           height: 160,
           width: 160),
           Center(
             child: Text(
                "habitHelp",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
fontSize: defaultSpacing * 3,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
          ),
           ),
        ],
      ),

    );
  }
}
