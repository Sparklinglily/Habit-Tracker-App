import 'package:flutter/material.dart';
import 'package:habit_help/screens/loginPage.dart';
import '../constants/constants.dart';
import 'package:habit_help/screens/confirmEmail.dart';



class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                    child: const Center(
                      child:  Text("Create Account", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: defaultSpacing * 2
                      ),
                      ),
                    ),

                ),


                      const SizedBox(height: defaultSpacing),
                      //email section
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                        child: Container(
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
                                hintText: 'enter your name',
                                prefixIcon: Icon(Icons.person),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 20)),
                          ),
                        ),
                      ),

                      const SizedBox(height: defaultSpacing),


                      //email
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                        child: Container(
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
                            decoration: const InputDecoration(
                                hintText: 'enter your email',
                                prefixIcon: const Icon(Icons.lock),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 20)),
                          ),
                        ),
                      ),
                      const SizedBox(height: defaultSpacing ),
                      //create assword

                      Padding(
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                        child: Container(
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
                            decoration: const InputDecoration(
                                hintText: 'create password',
                                prefixIcon: const Icon(Icons.lock
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 20)),
                          ),
                        ),
                      ),

                      const SizedBox(height: defaultSpacing * 4 ),


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
                                builder: ((context) => const ConfirmEmail()),
                              ));
                        }),
                        child: const Text(
                          "Submit", style: TextStyle(
                            color: background,
                            fontWeight: FontWeight.bold, fontSize: defaultSpacing * 1.2),
                        ),
                      ),

                      const SizedBox(height: defaultSpacing* 6),

                      RichText(text: TextSpan(
                        text:  'Already have an account? ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: defaultSpacing, color: secondaryLight),

                        children: [
                          TextSpan(
                            text: 'Login',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: defaultSpacing * 1.2,
                        color: secondaryLight,
                        fontWeight: FontWeight.bold,
                      ),
                      )

                        ]
                      ),


                      )
                    ],

                  ),
                )
          )


    );
  }
}
