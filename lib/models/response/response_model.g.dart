// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseModel _$$_ResponseModelFromJson(Map<String, dynamic> json) =>
    _$_ResponseModel(
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
      data: json['data'],
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_ResponseModelToJson(_$_ResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'error': instance.error,
    };
