// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reels/features/reels/presentation/manager/video_cubit/video_cubit.dart';

import 'build_video_widget.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String videoName;
  const VideoPlayerWidget({
    super.key,
    required this.videoName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoCubit(width: 1.sw, height: 1.sh, videoName: videoName),
      child: const BuildVideoWidget(),
    );
  }
}
