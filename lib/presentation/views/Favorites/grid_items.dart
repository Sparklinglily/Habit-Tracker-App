import 'package:flutter/material.dart';

class GridItemData {
  final String image;
  final String title;
  final String miniTitle;
  final Color color;
  final Function()? onTapped;

  GridItemData(
      {required this.onTapped,
      required this.color,
      required this.image,
      required this.miniTitle,
      required this.title});
}

class GridItem extends StatelessWidget {
  const GridItem({required this.gridData, super.key});
  final GridItemData gridData;

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.sizeOf(context);
    return Card(
        child: Column(
      children: [
        Stack(children: [
          Container(
              height: 200,
              child: Image.asset(
                gridData.image,
                fit: BoxFit.contain,
              )),
          Positioned(
              left: 16,
              top: 16,
              child: InkWell(
                onTap: gridData.onTapped,
                child: Container(
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.delete),
                ),
              ))
        ]),
        Container(
          decoration: BoxDecoration(
            color: gridData.color,
          ),
          child: Column(children: [
            Text(gridData.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Icon(Icons.group), Text(gridData.miniTitle)],
            ),
          ]),
        )
      ],
    ));
  }
}
