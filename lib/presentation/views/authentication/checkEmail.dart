import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/authentication/authMethods.dart';
import 'package:habit_help/presentation/views/authentication/loginPage.dart';

import '../../styles/constants.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  void onPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void onPressed2(context) {
    context.read<FirebaseAuthMethods>().passwordReset(widget.email, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/welcome.png"),
                        fit: BoxFit.cover)),
              ),
            ],
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Check your mail",
                  style: TextStyle(
                    fontSize: defaultSpacing * 2,
                  ),
                ),
                const SizedBox(height: defaultSpacing),
                Text(
                  "We sent a reset password link \n to "
                  "${widget.email}",
                  style: const TextStyle(fontSize: defaultSpacing * 1.2),
                )
              ],
            ),
          ),
          const SizedBox(height: defaultSpacing * 2),

          //login button
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryLight,
                minimumSize: const Size(230, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                onPressed();
              },
              child: const Text(
                "Log in",
                style: TextStyle(
                    color: background,
                    fontWeight: FontWeight.bold,
                    fontSize: defaultSpacing * 1.2),
              ),
            ),
          ),
          const SizedBox(height: defaultSpacing),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn't receive mail?"),
              TextButton(
                  onPressed: () {
                    onPressed2(context);
                  },
                  child: const Text(
                    "Click to Resend",
                  ))
            ],
          )
        ],
      ),
    );
  }
}
