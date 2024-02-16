import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:habit_help/presentation/styles/constants.dart';

class ProfilePageTiles extends StatelessWidget {
  final Color color;
  final String title;
  final String? subtitle;

  final Widget? icon;
  final AssetImage image;
  const ProfilePageTiles(
      {required this.color,
      required this.title,
      this.subtitle,
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
          trailing: icon),
    );
  }
}

class LeaderboardTile extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String rank;
  final Widget icon;

  const LeaderboardTile(
      {required this.image,
      required this.rank,
      required this.icon,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      height: 75,
      width: size.height * .41,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 246, 237, 224),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [BoxShadow(color: fontLight, offset: Offset(1, 2))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: image,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(title)
            ],
          ),
          Row(
            children: [
              Text(rank),
              Container(
                color: primaryLight,
                padding: EdgeInsets.all(5),
                child: icon,
              )
            ],
          )
        ],
      ),
    );
  }
}
