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
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        color: const Color.fromARGB(255, 249, 248, 246),
        child: Column(
          children: [
            Stack(children: [
              FractionallySizedBox(
                child: Image.asset(
                  gridData.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  right: 16,
                  top: 16,
                  child: InkWell(
                    onTap: gridData.onTapped,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.delete,
                        size: 17,
                        color: primaryLight,
                      ),
                    ),
                  ))
            ]),
            Container(
              decoration: BoxDecoration(
                color: gridData.color,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        gridData.title,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.group,
                            size: 18,
                            color: primaryLight,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(gridData.miniTitle,
                              style: const TextStyle(
                                fontSize: 14,
                              ))
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ));
  }
}
