import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/features/reels/presentation/manager/video_cubit/video_states.dart';
import 'package:video_player/video_player.dart';

class VideoCubit extends Cubit<VideoStates> {
  late final VideoPlayerController _videoPlayerController;
  late final ChewieController _chewieController;

  ChewieController get chewieController => _chewieController;
  VideoPlayerController get videoPlayerController => _videoPlayerController;
  bool isReady = false;
  final String videoName;
  final double width;
  final double height;
  VideoCubit(
      {required this.width, required this.height, required this.videoName})
      : super(InitVideoState()) {
    initVideo();
  }

  void initVideo() async {
    debugPrint('before asset video');
    emit(VideoLoadingState());

    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(videoName));

      debugPrint('after asset video');

      await _videoPlayerController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoInitialize: true,
        looping: true,
        showControls: true,
        autoPlay: true,
        // aspectRatio: 16 / 9,
        aspectRatio: width / height,
        allowFullScreen: false,
      );
      isReady = true;
      emit(VideoSuccessState());
    } catch (e) {
      debugPrint('error with initialize video');
      emit(VideoErrorState());
    }
  }

  @override
  Future<void> close() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    return super.close();
  }
}
