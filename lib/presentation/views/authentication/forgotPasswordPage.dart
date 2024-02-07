import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';
import 'package:habit_help/presentation/views/authentication/authMethods.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'widgets/showSnackBar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //function that happens when the reset password button is clicked ,
    // calling the firebase function for reset password
    Future<void> uponPress(email) async {
      try {
        await context
            .read<FirebaseAuthMethods>()
            .passwordResetLink(email, context);
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message!);
      }
    }

    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/welcome.png"),
                        fit: BoxFit.cover)),
              ),

              //FORGOT PASSWORD TEXT
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                  "Forgot Password!",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: defaultSpacing * 2),
                ),
              ),
              SizedBox(
                height: defaultSpacing * 2,
              ),

              Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enter your  email to receive a reset\n "
                      "password link",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: defaultSpacing),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultSpacing),

              //textfield
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      //the email validator pACKAGE is used in place oF the RegeX EMAIL VALIDATOR
                      email != null && EmailValidator.validate(email)
                          ? null
                          : "Enter valid Email Address",
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: secondaryLight),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "janeDoe@gmail.com",
                      labelText: "Email Address",
                      suffixIcon: Icon(Icons.email_outlined)),
                ),
              ),
              SizedBox(height: defaultSpacing * 5),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryLight,
                  minimumSize: const Size(340, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
                //to check that the email in the textfield is validated
                // and that the reset link should be sent else show error in sncakbar
                onPressed: () {
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {
                    uponPress(emailController.text);
                  } else {
                    showSnackBar(context, "Enter valid email");
                  }
                },
                child: const Text(
                  "Reset Password",
                  style: TextStyle(
                      color: background,
                      fontWeight: FontWeight.bold,
                      fontSize: defaultSpacing * 1.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
