import 'package:flutter/material.dart';
import '../core/constants/constants.dart';

class DailyQuotes extends StatefulWidget {
  const DailyQuotes({Key? key}) : super(key: key);

  @override
  State<DailyQuotes> createState() => _DailyQuotesState();
}

class _DailyQuotesState extends State<DailyQuotes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Daily Quotes",
            style: TextStyle(
                color: fontDark,
                fontSize: defaultSpacing * 1.4,
                fontWeight: FontWeight.w500),
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: 8.0,
          )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                Image(
                  image: AssetImage(
                    "images/quotes.png",
                  ),
                  fit: BoxFit.fill,
                  height: 150,
                  width: 300,
                ),
                SizedBox(
                  width: 10,
                ),
                Image(
                  image: AssetImage("images/quotes.png"),
                  fit: BoxFit.fill,
                  height: 150,
                  width: 300,
                ),
                SizedBox(
                  width: 10,
                ),
                Image(
                  image: AssetImage("images/quotes.png"),
                  fit: BoxFit.fill,
                  height: 150,
                  width: 300,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
