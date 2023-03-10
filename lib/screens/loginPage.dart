import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:habit_help/screens/actualLoginPage.dart';
import 'package:habit_help/screens/signUpPage.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: SafeArea(child:
          Column(
            children: [
              const SizedBox(height: defaultSpacing * 5),
              const Image(image: AssetImage("images/logo.png"),
                  height: 150,
                  width: 150),
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
              // Spacer(),
              Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                  AssetImage("images/loginDecor.png"),
                    fit: BoxFit.cover
                  ),
                ),
                //inorder to be able to place buttons within
                child: Column(
                  children: [
                    SizedBox(height: defaultSpacing * 13),
                    //login button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: background,
                        minimumSize: const Size(310, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                      ),
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const LoginDetails()),
                            ));
                      }),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: primaryLight ,
                            fontWeight: FontWeight.bold, fontSize: defaultSpacing * 1.2),
                      ),
                    ),
                    const SizedBox( height: defaultSpacing),
                    //sign upp button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryLight,
                        minimumSize: const Size(310, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                      ),
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const CreateAccount()),
                            ));
                      }),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: background,
                            fontWeight: FontWeight.bold, fontSize: defaultSpacing * 1.2),
                      ),
                    )

                  ],
                ) ,
              ),



            ],

          ),


      ),
    );
  }
}

