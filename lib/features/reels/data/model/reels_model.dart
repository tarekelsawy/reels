// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ReelsModel extends Equatable {
  final int id;
  final String? video;
  final String? likeCounts;
  const ReelsModel({
    required this.id,
    required this.video,
    required this.likeCounts,
  });

  factory ReelsModel.fromJson(Map<String , dynamic> json) {
    return ReelsModel(
      id: json['id'],
      video: json['video'],
      likeCounts: json['likeCounts'],
    );
  }

  @override
  List<Object> get props => [id, video!, likeCounts!];
}
