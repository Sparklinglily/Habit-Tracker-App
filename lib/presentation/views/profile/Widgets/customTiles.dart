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
            style: const TextStyle(),
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
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 75,
      width: size.height * .41,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 246, 237, 224),
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
                padding: const EdgeInsets.all(5),
                child: icon,
              )
            ],
          )
        ],
      ),
    );
  }
}

class ChallengeListTile extends StatelessWidget {
  final String image;
  final String challengeTitle;
  final String numberOfDays;
  final Widget peopleIcon;
  final String numberOfPeople;
  final Widget numberOfDaysIcon;

  const ChallengeListTile(
      {required this.challengeTitle,
      required this.image,
      required this.numberOfDays,
      required this.numberOfDaysIcon,
      required this.numberOfPeople,
      required this.peopleIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 200,
          width: size.height * 0.44,
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30), bottom: Radius.circular(5))),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              challengeTitle,
              style: const TextStyle(
                  color: fontDark, fontWeight: FontWeight.w500, fontSize: 17),
            ),
            const SizedBox(
              width: 200,
            ),
            numberOfDaysIcon,
            Text(
              numberOfDays,
              style: const TextStyle(
                  color: secondaryLight,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            peopleIcon,

            Text(numberOfPeople,
                style: const TextStyle(
                    color: secondaryLight,
                    fontWeight: FontWeight.w400,
                    fontSize: 17)),
            // SizedBox(height: 5,)
          ],
        ),
      ],
    );
  }
}
