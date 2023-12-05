import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/AppComponents/blurredContainer.dart';
import '../../../../core/constants/constants.dart';
import '../../authentication/loginPage.dart';

class ImageGrids extends StatelessWidget {
  ImageGrids({Key? key, required this.data, required this.onTap})
      : super(key: key);

  bool isClicked = false;

  final ImageGridData data;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Stack(
          children: [
            Image.asset(
              data.image, fit: BoxFit.cover,
              height: size.height,
              width: size.width,

              // color: Colors.black,
            ),
            Positioned(
              child: Checkbox(value: isClicked, onChanged: null),
              right: 16,
            ),
            BlurredContainer(
                // height: constraints.maxHeight * 0.3,
                borderRadius: 8,
                width: size.width,
                height: double.maxFinite,
                padding: EdgeInsets.zero,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data.text,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ))
                //   .padding(
                // padding:
                //     const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                // ),
                ),
          ],
        ),
      ),
    );
  }
}

class ImageGridData {
  final String image;
  final Widget checkBox;
  final String text;

  ImageGridData({
    required this.image,
    required this.checkBox,
    required this.text,
  });
}
