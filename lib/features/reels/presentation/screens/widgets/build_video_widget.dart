import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels/core/widgets/laoding_screen.dart';
import 'package:reels/features/reels/presentation/manager/video_cubit/video_cubit.dart';
import 'package:reels/features/reels/presentation/manager/video_cubit/video_states.dart';

import '../../../../../core/widgets/video_not_work_widget.dart';

class BuildVideoWidget extends StatelessWidget {
  const BuildVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    VideoCubit cubit = context.read<VideoCubit>();
    return BlocBuilder<VideoCubit, VideoStates>(
      builder: (context, state) {
        Widget widget = Container(
          color: Colors.black,
        );
        if (state is VideoLoadingState) {
          widget = const LaodingScreen();
        } else if (state is VideoErrorState) {
          widget = const ProblemWithVideoWidget();
        } else if (state is VideoSuccessState) {
          widget = SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Chewie(controller: cubit.chewieController));
        }
        return widget;
      },
    );
  }
}
