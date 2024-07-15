import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels/core/utils/app_colors.dart';
import 'package:reels/core/utils/styles.dart';
import 'package:reels/features/reels/presentation/manager/reels_cubit/reels_cubit.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  const ErrorScreen({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    ReelsCubit cubit = context.read();
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.backGroundOfcircularPrograssIndicatorColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: Styles.textStyle20.copyWith(color: AppColors.errorTextColor),
          ),
          SizedBox(
            height: 100.h,
          ),
          InkWell(
            onTap: () => cubit.getReels(),
            child: Container(
              height: 40.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                  color: AppColors.errorTextColor,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                child: Text('connect',
                    style: Styles.textStyle20.copyWith(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
