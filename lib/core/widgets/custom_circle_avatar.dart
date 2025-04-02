import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.imagePath,
    this.radius = 100,
    this.backgroundColor,
  });
  final String imagePath;
  final double radius;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: (radius) + 1,
      backgroundColor: backgroundColor ?? Colors.transparent,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
