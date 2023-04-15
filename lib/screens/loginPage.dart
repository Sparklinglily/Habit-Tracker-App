import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:habit_help/screens/homeScreen.dart';
import 'package:habit_help/screens/signUpPage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                      AssetImage("images/welcome.png"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              //Column with padding

                 Container(
                   margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      //welcome
                      const Text("Welcome!!", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: defaultSpacing * 3
                      ),
                        textAlign: TextAlign.left,
                      ),

                      //lETS GET YOU STARTED
                      const Text("Let's get you started",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: defaultSpacing
                        ),),

                      const SizedBox(height: defaultSpacing * 2),
                      //email section

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: primaryLight,
                              // width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: const TextField(
                          style: TextStyle(
                              fontSize: defaultSpacing * 1.2, color: secondaryLight),
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'enter your password',
                              prefixIcon: Icon(Icons.email),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 20)),
                        ),
                      ),

                      const SizedBox(height: defaultSpacing),

                      //password section
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: primaryLight,
                              // width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: const TextField(
                          style: TextStyle(
                              fontSize: defaultSpacing * 1.2, color: secondaryLight),
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'enter your password',
                              prefixIcon: Icon(Icons.lock),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 20)),
                        ),
                      ),



                      //remember me

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(

                                activeColor: primaryLight,
                                value: showValue, onChanged: (value) {
                                setState(() {
                                  showValue = value!;
                                });
                              },

                              ),
                              const Text("Remember me",
                                style: TextStyle(
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                    fontSize: defaultSpacing
                                ),
                              ),
                            ],
                          ),

                          const Text("Forgot password?",
                            style: TextStyle(
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                                fontSize: defaultSpacing
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: defaultSpacing/ 2),

                      Center(
                        child: ElevatedButton(
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
                                  builder: ((context) => const HomePage()),
                                ));
                          }),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: background,
                                fontWeight: FontWeight.bold, fontSize: defaultSpacing * 1.2),
                          ),
                        ),
                      ),

                      const SizedBox(height: defaultSpacing* 8),




                      Center(
                        child: RichText(
                          text:TextSpan(
                              text:  "Don\'t have an account ?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: defaultSpacing, color: secondaryLight),
                              children: [
                                TextSpan(
                                  text: 'Signup',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: defaultSpacing * 1.2,
                                    color: secondaryLight,
                                    fontWeight: FontWeight.bold,
                                  ),

                                )
                              ]
                          ),
                        ),
                      )



                    ],
                  )

                    ),

                    //sign in




                ]

              )

          )



      ),
    );
  }
}
