import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  BlurredContainer({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor,
    this.sigmaX,
    this.sigmaY,
    this.borderRadius,
    this.padding,
    this.child,
  }) : super(key: key);
  double? height, width, sigmaX, sigmaY;
  Color? backgroundColor;
  double? borderRadius;
  EdgeInsets? padding;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(borderRadius ?? 8),
        bottomRight: Radius.circular(borderRadius ?? 8),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX ?? 5.0, sigmaY: sigmaY ?? 5.0),
        child: Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromRGBO(255, 255, 255, 0.71).withOpacity(0.1)
              : Color.fromARGB(177, 255, 255, 255).withOpacity(0.1),
          // : AppColors.gray.shade500.withOpacity(0.8),
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          height: height,
          width: width,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.amber.withOpacity(0.3)
                    //AppColors.gray.shade500.withOpacity(0.3),
                    ),
              ),
              child!,
            ],
          ),
        ),
      ),
    );
  }
}

class BlurredContainerTwo extends StatelessWidget {
  const BlurredContainerTwo({
    Key? key,
    this.height,
    this.width,
    this.sigmaX,
    this.sigmaY,
    this.child,
  }) : super(key: key);
  final double? height, width, sigmaX, sigmaY;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX ?? 5.0, sigmaY: sigmaY ?? 5.0),
        child: Container(
          color: const Color.fromARGB(255, 63, 61, 61).withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
