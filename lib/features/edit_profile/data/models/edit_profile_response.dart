import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
  final String? message;
  final UserData? data;
  final String? status;

  EditProfileResponse({this.message, this.data, this.status});

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseToJson(this);
}

@JsonSerializable()
class UserData {
  final int? id;
  final String? username;
  final String? email;
  final String? image;

  UserData({this.id, this.username, this.email, this.image});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
