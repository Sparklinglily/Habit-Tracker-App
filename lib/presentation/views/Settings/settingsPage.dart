import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';
import 'package:habit_help/widgets/settingsPageTiles.dart';

class SettingsPage extends StatelessWidget {
  final picture =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&usqp=CAU";
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            Row(children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              const Text(
                'Settings',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ]),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(picture),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mary Peters',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'marypeters@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromARGB(255, 139, 138, 138)),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            SettingsOptionTiles(
              iconOption: const Icon(
                Icons.person,
                color: primaryDark,
                size: 24,
              ),
              option: 'Account',
              onTap: () {},
            ),

            SettingsOptionTiles(
              iconOption: const Icon(
                Icons.lock,
                color: primaryDark,
                size: 24,
              ),
              option: 'Privacy',
              onTap: () {},
            ),

            SettingsOptionTiles(
              iconOption: const Icon(
                Icons.language,
                color: primaryDark,
                size: 24,
              ),
              option: 'Language',
              onTap: () {},
            ),

            SettingsOptionTiles(
              iconOption: const Icon(
                Icons.info_outline,
                size: 24,
                color: primaryDark,
              ),
              option: 'About Us',
              onTap: () {},
            ),

            SettingsOptionTiles(
              iconOption: const Icon(
                Icons.logout,
                color: primaryDark,
                size: 24,
              ),
              option: 'Log Out',
              onTap: () {},
            ),
            //SizedBox(height: 10,),
          ],
        )),
      ),
    );
  }
}
