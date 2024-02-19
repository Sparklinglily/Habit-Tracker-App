import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';

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
        color: const Color.fromARGB(255, 249, 248, 246),
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                gridData.image,
                fit: BoxFit.contain,
              ),
              Positioned(
                  right: 16,
                  top: 16,
                  child: InkWell(
                    onTap: gridData.onTapped,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.delete,
                        size: 16,
                        color: primaryLight,
                      ),
                    ),
                  ))
            ]),
            Container(
              decoration: BoxDecoration(
                color: gridData.color,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      gridData.title,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.group,
                          size: 18,
                          color: primaryLight,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(gridData.miniTitle,
                            style: TextStyle(
                              fontSize: 14,
                            ))
                      ],
                    ),
                  ]),
            )
          ],
        ));
  }
}
