// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/features/reels/data/model/reels_model.dart';

import 'package:reels/features/reels/data/repo/reels_repo.dart';

import 'reels_states.dart';

class ReelsCubit extends Cubit<ReelsState> {
  final BaseReelsRepo repo;
  List<ReelsModel> reels = [];
  ReelsCubit({required this.repo}) : super(ReelsInitState());

  Future<void> getReels() async {
    emit(GetReelsLoadingState());
    var data = await repo.getReels();
    data.fold(
      (l) => emit(GetReelsErrorState(errorMessage: l.errMessage)),
      (r) {
        reels = r;
        debugPrint('right ${r.length}');
        emit(GetReelsSuccessState());
      },
    );
  }
}
