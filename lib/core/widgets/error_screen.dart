import 'package:flutter/material.dart';
import 'package:reels/core/utils/app_colors.dart';
import 'package:reels/core/utils/styles.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  const ErrorScreen({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.backGroundOfcircularPrograssIndicatorColor,
      child: Center(
        child: Text(
          errorMessage,
          style: Styles.textStyle30.copyWith(color: AppColors.errorTextColor),
        ),
      ),
    );
  }
}
