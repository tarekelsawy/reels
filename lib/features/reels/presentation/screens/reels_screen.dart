import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/core/utils/app_strings.dart';
import 'package:reels/core/widgets/error_screen.dart';
import 'package:reels/features/reels/presentation/screens/widgets/video_player_widget.dart';

import '../../../../core/widgets/laoding_screen.dart';
import '../../../../core/widgets/video_not_work_widget.dart';
import '../manager/reels_cubit/reels_cubit.dart';
import '../manager/reels_cubit/reels_states.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReelsCubit cubit = context.read<ReelsCubit>();
    return Scaffold(
      body: BlocBuilder<ReelsCubit, ReelsState>(
        builder: (context, state) {
          if (state is GetReelsLoadingState) {
            return const LaodingScreen();
          } else if (state is GetReelsErrorState) {
            return ErrorScreen(
              errorMessage: state.errorMessage,
            );
          } else if (state is GetReelsSuccessState) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: cubit.reels.length,
              onPageChanged: (value) {
                debugPrint('value $value');
                cubit.onPageChange(value);
              },
              itemBuilder: (context, index) {
                debugPrint('index is $index');
                return cubit.reels[index].video != null
                    ? VideoPlayerWidget(
                        key: Key('${cubit.reels[index].video!}$index'),
                        videoName: cubit.reels[index].video!)
                    : const ProblemWithVideoWidget();
              },
            );
          }
          return const ErrorScreen(errorMessage: AppStrings.errorMessage);
        },
      ),
    );
  }
}
