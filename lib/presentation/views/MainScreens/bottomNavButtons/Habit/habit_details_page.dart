import 'package:flutter/material.dart';

class HabitDetailsPage extends StatelessWidget {
  const HabitDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.width * 0.6,
                width: size.height * 0.47,
                decoration: const BoxDecoration(
                  //color: Color.fromARGB(255, 248, 238, 247),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(120),
                      bottomLeft: Radius.circular(120.0)),
                ),
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer, // Add this line
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(120),
                    bottomLeft: Radius.circular(120.0),
                  ),
                  child: Image.asset(
                    'images/waterhold.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
