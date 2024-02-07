import 'package:flutter/material.dart';
import 'package:habit_help/core/constants/constants.dart';

class SettingsOptionTiles extends StatelessWidget {
  final Widget iconOption;
  final String option;
  final Function()? onTap;
  const SettingsOptionTiles(
      {required this.iconOption,
      required this.onTap,
      required this.option,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              icon: iconOption,
              label: Text(
                option,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14, color: fontDark),
              ),
              onPressed: onTap,
            ),
            const Divider(
              indent: 12,
              endIndent: 12,
              thickness: 1,
            )
          ],
        ));
  }
}
