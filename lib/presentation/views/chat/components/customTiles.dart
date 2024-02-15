import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:habit_help/presentation/styles/constants.dart';

class ProfilePageTiles extends StatelessWidget {
  final Color color;
  final String title;
  final String? subtitle;
  final Widget? rank;
  final Widget? icon;
  final AssetImage image;
  const ProfilePageTiles(
      {required this.color,
      required this.title,
      this.subtitle,
      this.rank,
      required this.image,
      this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: 75,
      width: size.height * .41,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [BoxShadow(color: fontLight, offset: Offset(1, 2))]),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: image,
          radius: 25,
        ),
        title: Text(
          title,
          style: TextStyle(),
        ),
        subtitle: Text(subtitle ?? ''),
        trailing: icon,
      ),
    );
  }
}
