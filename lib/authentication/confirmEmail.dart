import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:habit_help/screens/congrats.dart';

class ConfirmEmail extends StatefulWidget {
  const ConfirmEmail({Key? key}) : super(key: key);

  @override
  State<ConfirmEmail> createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: Column(
          children: [
            Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                AssetImage("images/welcome.png"),
                fit: BoxFit.cover),
          ),
        ),
        //confirm emAIL
            Padding(
              padding: const EdgeInsets.fromLTRB(13,0,13,5),
              child: Container(
              alignment: Alignment.topLeft,
              //welcome
              child: Center(
                child: const Text("Confirm your email", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: defaultSpacing * 2
                ),
                  textAlign: TextAlign.left,
                ),
              ),
          ),
            ),
              //4 digits
              Padding(
                padding: const EdgeInsets.fromLTRB(13,2,13,0),
                child: Container(
                  alignment:Alignment.topLeft ,
                  child: const Text("Enter the 4 digits code sent to your email address",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: defaultSpacing *1.4
                    ),),
                ),
              ),

            const SizedBox(height: defaultSpacing * 2 ),
            //4 digits
            //1st box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryLight,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: const TextField(
                    style: TextStyle(
                        fontSize: defaultSpacing * 3, color: secondaryLight),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20))

                  ),

                ),
                //2nd box
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryLight,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: const TextField(
                    style: TextStyle(
                        fontSize: defaultSpacing * 3, color: secondaryLight),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20))

                  ),

                ),

                //3rd box
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryLight,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: const TextField(
                    style: TextStyle(
                        fontSize: defaultSpacing * 3, color: secondaryLight),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20)),
                  ),

                ),
                //4th box

                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryLight,
                      ),
                      borderRadius: BorderRadius.circular(10)),

                  child: const TextField(
                    style: TextStyle(
                        fontSize: defaultSpacing * 3, color: secondaryLight),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20))

                  ),

                ),
              ],
            ),

            const SizedBox(height: defaultSpacing* 3,),
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
                      builder: ((context) => const ProceedToHomePage()),
                    ));
              }),
              child: const Text(
                'Proceed',
                style: TextStyle(
                    color: background,
                    fontWeight: FontWeight.bold, fontSize: defaultSpacing * 1.2),
              ),
            ),

            //elevated button




          ],
        ),
        //4 digits

      ),

    );

  }
}
