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
  List images = [
    "google.png",
    "twitter.png",
    "facebook.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                child:  Column(
                  children: const [
                    SizedBox(height: 140),
                    Text("Create Account", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: defaultSpacing * 2
                    ),
                    ),
                  ],
                )

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
                  decoration: InputDecoration(
                      hintText: 'enter your email',
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 20)),
                ),
              ),
            ),
            const SizedBox(height: defaultSpacing ),
            //create password

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
                      hintText: 'create password',
                      prefixIcon: Icon(Icons.lock
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 20)),
                ),
              ),
            ),

            const SizedBox(height: defaultSpacing * 3 ),


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
                "Sign Up", style: TextStyle(
                  color: background,
                  fontWeight: FontWeight.bold, fontSize: defaultSpacing * 1.2),
              ),
            ),

            const SizedBox(height: defaultSpacing* 2.5),

            RichText(text: TextSpan(
              text:  'Sign up using one of the following methods ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: defaultSpacing, color: secondaryLight),


            ),


            ),

            Wrap(
              children: List<Widget>.generate(3,
                      (index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.grey[300],
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage("images/" + images[index]),
                        ),
                      ),
                    );

                  }),

            )
          ],

        ),
      )




    );
  }
}
