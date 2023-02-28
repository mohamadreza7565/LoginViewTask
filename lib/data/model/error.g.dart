// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
  json['statusCode'] as int,
  (json['message'] as List<dynamic>).map((e) => e as String).toList(),
  json['error'] as String,
);

Map<String, dynamic> _$ErrorModelToJson(ErrorModel? instance) => <String, dynamic>{
  'statusCode': instance?.statusCode,
  'message': instance?.message,
  'error': instance?.error,
};
