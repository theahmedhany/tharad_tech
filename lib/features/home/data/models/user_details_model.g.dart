// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailsModelAdapter extends TypeAdapter<UserDetailsModel> {
  @override
  final int typeId = 0;

  @override
  UserDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailsModel(
      message: fields[0] as String?,
      data: fields[1] as UserData,
      status: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 1;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData(
      id: fields[0] as int,
      username: fields[1] as String,
      email: fields[2] as String,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsModel _$UserDetailsModelFromJson(Map<String, dynamic> json) =>
    UserDetailsModel(
      message: json['message'] as String?,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$UserDetailsModelToJson(UserDetailsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'image': instance.image,
    };
