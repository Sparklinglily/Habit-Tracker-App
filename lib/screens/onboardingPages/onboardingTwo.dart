import 'package:flutter/material.dart';
import 'package:habit_help/screens/onboardingPages/onboardingThree.dart';
import '../../constants/constants.dart';

class onboardingTwo extends StatefulWidget {
  const onboardingTwo({Key? key}) : super(key: key);

  @override
  State<onboardingTwo> createState() => _onboardingTwoState();
}

class _onboardingTwoState extends State<onboardingTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: background,
      child: SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.fromLTRB(11, 14, 11, 14),
          child: Column(
            children: [
              const SizedBox(height: defaultSpacing * 2 ),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: ()=> null, child: const Text("Skip"),
                  style: TextButton.styleFrom(
                    textStyle:  const TextStyle(
                        color: primaryLight,
                        fontSize: defaultSpacing * 1.5,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
              const Image(image: AssetImage("images/healthyHabit.png"),
                  height: 300,
                  width: 300
              ),
              const SizedBox(height: defaultSpacing * 1.4),
              const Text("Develop new habits",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: defaultSpacing * 2
                  )
              ),
              const SizedBox(height: defaultSpacing / 2 ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSpacing * 1.5),
                child: Text("Forming new and healthy habits is an "
                    "integral part of learning new habits. Create"
                    " new habits through consistency and dedication.",
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: defaultSpacing
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: defaultSpacing * 7),
              Padding(
                padding: const EdgeInsets.only(left: defaultSpacing * 19),
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const OnboardingThree(),
                  ));
                },
                  child: const Text("Next"),
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: defaultSpacing * 1.5
                    ),),
                ),
              ),

            ],
          ),
        ),

      ),
    ),

    );



  }
}
