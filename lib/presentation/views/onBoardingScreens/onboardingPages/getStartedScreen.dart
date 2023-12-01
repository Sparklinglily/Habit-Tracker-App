import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import 'package:habit_help/presentation/views/onBoardingScreens/onboardingPages/loginOrSignUpPage.dart';



class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: SafeArea(
          child:
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 29, 11, 14),
            child: Column(
              children: [
                const SizedBox(height: defaultSpacing * 4.3),
                const Image(image: AssetImage("images/toDo.png"),
                    height: 300,
                    width: 300
                ),
                const SizedBox(height: defaultSpacing * 1.4),
                const Text("Set daily goals",
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
                const SizedBox(height: defaultSpacing * 3.7),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryLight,
                    minimumSize: const Size(290, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                  ),
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const LoginButton()),
                        ));
                  }),
                  child: const Text(
                    'Get started',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: defaultSpacing * 1.2),
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


