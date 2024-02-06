import 'package:flutter/material.dart';

class SettingsOptionTiles extends StatelessWidget {
  final Widget iconOption;
  final String option;
  const SettingsOptionTiles(
      {required this.iconOption, required this.option, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          children: [
            ListTile(
              leading: iconOption,
              title: Text(option),
            ),
            Divider(
              indent: 12,
              endIndent: 12,
              thickness: 2,
            )
          ],
        ));
  }
}
