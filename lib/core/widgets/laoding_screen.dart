import 'package:flutter/material.dart';
import 'package:reels/core/utils/app_colors.dart';

class LaodingScreen extends StatelessWidget {
  const LaodingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.backGroundOfcircularPrograssIndicatorColor,
      child: const Center(
          child: CircularProgressIndicator(
        color: AppColors.circularPrograssIndicatorColor,
      )),
    );
  }
}
