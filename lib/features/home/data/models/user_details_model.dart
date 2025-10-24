import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_details_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserDetailsModel extends HiveObject {
  @HiveField(0)
  final String? message;

  @HiveField(1)
  final UserData data;

  @HiveField(2)
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

@HiveType(typeId: 1)
@JsonSerializable()
class UserData extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
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
