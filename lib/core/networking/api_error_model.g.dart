// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      message: json['message'] as String?,
      status: (json['status'] as num?)?.toInt(),
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };
