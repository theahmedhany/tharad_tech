import 'package:json_annotation/json_annotation.dart';

part 'user_details_model.g.dart';

@JsonSerializable()
class UserDetailsModel {
  final String? message;
  final UserData data;
  final String status;

  UserDetailsModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsModelToJson(this);
}

@JsonSerializable()
class UserData {
  final int id;
  final String username;
  final String email;
  final String image;

  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.image,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
