import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/AppComponents/blurredContainer.dart';
import '../../../../core/constants/constants.dart';
import '../../authentication/loginPage.dart';

class ImageGrids extends StatefulWidget {
  ImageGrids({
    Key? key,
    required this.gridData,
  }) : super(key: key);

  final ImageGridData gridData;

  @override
  State<ImageGrids> createState() => _ImageGridsState();
}

class _ImageGridsState extends State<ImageGrids> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Card(
      child: Stack(
        children: [
          Image.asset(
            widget.gridData.imagePath, fit: BoxFit.cover,
            height: size.height,
            width: size.width,

            // color: Colors.black,
          ),
          Positioned(
            right: 5,
            child: Checkbox(
              value: widget.gridData.isChecked,
              onChanged: (value) {
                setState(() {
                  if (value != null) widget.gridData.isChecked = value;
                });
              },
              checkColor: Colors.amber,
              fillColor: MaterialStatePropertyAll(Colors.grey),
            ),
          ),
          Positioned(
              bottom: 0,
              child: BlurredContainer(
                borderRadius: 8,
                //check
                width: size.width * 0.45,
                padding: EdgeInsets.zero,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      widget.gridData.title,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ))
                //   .padding(
                // padding:
                //     const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                // ),
                ,
              ))
        ],
      ),
    );
  }
}

class ImageGridData {
  final int id;
  final String imagePath;
  bool isChecked;
  final String title;

  ImageGridData({
    required this.id,
    required this.imagePath,
    required this.isChecked,
    required this.title,
  });
}
