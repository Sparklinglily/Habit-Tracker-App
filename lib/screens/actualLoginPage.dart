import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:habit_help/screens/homeScreen.dart';
import 'package:habit_help/screens/signUpPage.dart';


class LoginDetails extends StatefulWidget {
  const LoginDetails({Key? key}) : super(key: key);

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {

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

              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 11),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      //welcome
                      child: const Text("Welcome!!", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: defaultSpacing * 3
                      ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //lETS GET YOU STARTED
                    Container(
                      alignment:Alignment.topLeft ,
                      child: const Text("Let's get you started",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: defaultSpacing
                        ),),
                    ),
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
                        decoration: const InputDecoration(
                            hintText: 'enter your password',
                            prefixIcon: const Icon(Icons.email),
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
                          decoration: const InputDecoration(
                              hintText: 'enter your password',
                              prefixIcon: const Icon(Icons.lock),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 20)),
                        ),
                      ),


                    const SizedBox(height: defaultSpacing/ 2),

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
                    const SizedBox(height: defaultSpacing ),

                    //sign in

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

                    const SizedBox(height: defaultSpacing* 4),

                Text(
                  'Dont have an account ?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: defaultSpacing, color: secondaryLight),
                ),
                TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateAccount(),
                ));
                },
                  child: Text(
                    'Signup',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: defaultSpacing * 1.2,
                      color: secondaryLight,
                      fontWeight: FontWeight.bold,
                    ),
                  )






                )
                  ],

                ),
              )
            ]
          )


        ),
      ),
    );
  }
}
