// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ReelsState {}

class ReelsInitState extends ReelsState {}

class GetReelsLoadingState extends ReelsState {}

class GetReelsSuccessState extends ReelsState {}

class GetReelsErrorState extends ReelsState {
  final String errorMessage;
  GetReelsErrorState({
    required this.errorMessage,
  });
}
