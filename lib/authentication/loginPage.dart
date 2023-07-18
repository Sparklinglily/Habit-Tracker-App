import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/FirebaseAuthServices/authMethods.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import 'package:habit_help/pages/home/homeScreen.dart';
import 'package:habit_help/authentication/signUpPage.dart';
import 'package:email_validator/email_validator.dart';

import 'forgotPasswordPage.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void signInUser(){
    context.read<FirebaseAuthMethods>().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }



  bool showValue = false;

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        backgroundColor: background,
        body: SingleChildScrollView(
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

                       // Container(
                       //   decoration: BoxDecoration(
                       //       border: Border.all(
                       //         color: primaryLight,
                       //         // width: 1.0,
                       //       ),
                       //       borderRadius: BorderRadius.circular(10)), child:
                       TextFormField(
                           controller: emailController,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           validator: (email)=>
                           email != null && EmailValidator.validate(email)
                           ? null: "Enter valid email Address",

                           style: const TextStyle(
                               fontSize: defaultSpacing * 1.2, color: secondaryLight),
                           decoration:InputDecoration(
                             label: Text("Email Address"),
                               prefixIcon: Icon(Icons.email),
                             border: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.grey
                               ),
                                 borderRadius: BorderRadius.circular(13),

                             ),


                               // border: InputBorder.none,
                               // contentPadding: EdgeInsets.symmetric(vertical: 20)
                           ),
                         ),

                       // ),

                       const SizedBox(height: defaultSpacing),

                       //password section
                       // Container(
                       //
                       //   decoration: BoxDecoration(
                       //       border: Border.all(
                       //         color: primaryLight,
                       //         // width: 1.0,
                       //       ),
                       //       borderRadius: BorderRadius.circular(10)),
                       TextFormField(

                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           validator: (password)=>
                           password != null && password.length > 6
                           ? null: "Enter minimum of 6 characters",
                           controller: passwordController ,
                           style: const TextStyle(
                               fontSize: defaultSpacing * 1.2, color: secondaryLight),
                           obscureText: passwordVisible,
                           decoration:  InputDecoration(
                             label: Text("Password"),
                             border: OutlineInputBorder(
                               borderSide: const BorderSide(color: Colors.grey),
                                   borderRadius: BorderRadius.circular(13)
                             ),
                               prefixIcon: Icon(Icons.lock),


                               suffixIcon: IconButton(onPressed: (){
                                 setState(() {
                                   passwordVisible= !passwordVisible;
                                 });
                               },

                                   icon: Icon(passwordVisible
                                       ? Icons.visibility : Icons.visibility_off )),
                               // border: InputBorder.none,
                               // contentPadding: EdgeInsets.symmetric(vertical: 20)),
                         ),),




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

                            TextButton(onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPassword()));
                            },
                            child: const Text("Forgot password?",
                             style: TextStyle(
                               color: secondaryDark,
                                 height: 1.5,
                                 fontWeight: FontWeight.w500,
                                 fontSize: defaultSpacing
                             ),
                           ),
                            )
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
                           onPressed: signInUser,
                           child: const Text(
                             'Sign In',
                             style: TextStyle(
                                 color: background,
                                 fontWeight: FontWeight.bold, fontSize: defaultSpacing * 1.2),
                           ),
                         ),
                       ),

                       const SizedBox(height: defaultSpacing* 8),




                       // Center(
                       //   child: RichText(
                       //     text:TextSpan(
                       //         text:  "Don\'t have an account?",
                       //         style: Theme.of(context)
                       //             .textTheme
                       //             .bodyLarge
                       //             ?.copyWith(fontSize: defaultSpacing, color: secondaryLight),
                       //         children: [
                       //           TextSpan(
                       //             text: ' Signup',
                       //             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                       //               fontSize: defaultSpacing * 1.2,
                       //               color: secondaryLight,
                       //               fontWeight: FontWeight.bold,
                       //             ),
                       //
                       //           )
                       //         ]
                       //     ),
                       //   ),
                       // )
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("Dont have an account?", style: Theme.of(context)
                           .textTheme
                           .bodyLarge
                           ?.copyWith(fontSize: defaultSpacing, color: secondaryLight),),
                           TextButton(onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccount()));
                           }, child: Text("Sign Up",
                             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                               fontSize: defaultSpacing * 1.1,
                               color: primaryLight,
                               fontWeight: FontWeight.bold,
                             ),),)
                         ],
                       )



                     ],
                   )

               ),

               //sign in




             ]

         ),
        )



    );
  }
}

// Future SignIn() async {
//   //performing the authentication process using firebase
//   await FirebaseAuth.instance.signInWithEmailAndPassword
//     ( email: 'emailController.text.trim()', password: 'passwordController.text.trim()',
//   );

// }


