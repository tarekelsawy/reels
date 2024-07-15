// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:reels/core/config/cache_config.dart';
import 'package:reels/features/reels/data/model/reels_model.dart';

import 'package:reels/features/reels/data/repo/reels_repo.dart';
import 'dart:math';
import 'reels_states.dart';

class ReelsCubit extends Cubit<ReelsState> {
  final BaseReelsRepo repo;
  List<ReelsModel> reels = [];
  int currentCachedrange = 0;
  int batchOfCache = 10;
  bool isFetchingMore = false;
  ReelsCubit({required this.repo}) : super(ReelsInitState());

  Future<void> getReels() async {
    emit(GetReelsLoadingState());
    var data = await repo.getReels();
    data.fold(
      (l) => emit(GetReelsErrorState(errorMessage: l.errMessage)),
      (r)  {
        reels = r;
         cacheInitialVideos();
        emit(GetReelsSuccessState());
      },
    );
  }

  Future<void> cacheInitialVideos() async {
    currentCachedrange = min(batchOfCache, reels.length);
    for (int i = 0; i < currentCachedrange; ++i) {
      await cacheVideo(i);
    }
  }

  cacheVideo(int index) async {
    FileInfo? fileInfo =
        await kCacheManager.getFileFromCache(reels[index].video!);
    if (fileInfo == null) {
      await kCacheManager.downloadFile(reels[index].video!);
    }
  }

  void onPageChange(int index) {
    if (index >= currentCachedrange - 5 && !isFetchingMore) {
      cacheMoreVideos();
    }
  }

  cacheMoreVideos() async {
    isFetchingMore = true;
    int nextBatchStart = currentCachedrange;
    currentCachedrange = min(currentCachedrange + batchOfCache, reels.length);

    for (int i = nextBatchStart; i < currentCachedrange; ++i) {
      await cacheVideo(i);
    }

    isFetchingMore = false;
  }
}
