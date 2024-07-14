import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels/core/utils/app_colors.dart';


class ProblemWithVideoWidget extends StatelessWidget {
  const ProblemWithVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.backGroundOfcircularPrograssIndicatorColor,
      child: Center(
        child: Icon(Icons.report,size: 25.r,),
      ),
    );
  }
}