import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/onBoardingScreens/rewardPage.dart';
import '../../../../core/constants/constants.dart';

class RewardList extends StatefulWidget {
  const RewardList({Key? key}) : super(key: key);

  @override
  State<RewardList> createState() => _RewardListState();
}

class _RewardListState extends State<RewardList> {
  final sleeping =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTclYYJIAS5EfjGG8FdwopkB1MeFhewElWZkFfar6ogNU6kLsCqPi2W-7XmDEuort7nX3o&usqp=CAU";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(accent),
          minimumSize: MaterialStateProperty.all(Size(200, 70)),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Achievement(),
              ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: defaultRadius * 2,
              backgroundImage: NetworkImage(sleeping),
            ),
            const Text(
              "Get at least 7 hours of sleep",
              style: TextStyle(color: secondaryLight, fontSize: defaultSpacing),
            ),
            Padding(padding: EdgeInsets.only(right: 43)),
            Icon(
              Icons.card_giftcard_outlined,
              color: secondaryLight,
            ),
          ],
        ),
      ),
    );

    // tileColor: accent,
    // leading: CircleAvatar(
    //   radius: defaultRadius *2,
    //   backgroundImage: NetworkImage(sleeping),
    // ),
    // title: Text("Got enough sleep\n 3000 Streaks",
    // style: TextStyle(
    //     fontSize: defaultSpacing * 1.2,
    //     fontWeight: FontWeight.w400),),
    // trailing: const Icon(Icons.card_giftcard),
  }
}
