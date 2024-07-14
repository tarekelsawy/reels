// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:reels/core/error/failure.dart';
import 'package:reels/core/utils/api_service.dart';
import 'package:reels/features/reels/data/model/reels_model.dart';

abstract class BaseReelsRepo {
  Future<Either<Failure, List<ReelsModel>>> getReels();
}

class ReelsRepo extends BaseReelsRepo {
  final ApiService apiService;
  ReelsRepo({required this.apiService});
  @override
  Future<Either<Failure, List<ReelsModel>>> getReels() async {
    try {
      var data = await apiService.get();
      List<ReelsModel> reels = [];
      for (var e in data['data']) {
        reels.add(ReelsModel.fromJson(e));
      }

      return right(reels);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
