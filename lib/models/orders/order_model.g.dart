// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      id: json['id'] as int,
      otp: json['otp'] as String,
      boxNumber: json['box_number'] as int?,
      delivered: json['delivered'] as bool,
      status: json['status'] as String,
      product: ProductModel.fromJson(json['Product'] as Map<String, dynamic>),
      location: fromOrderLocationJson(json['Location'] as Map),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'otp': instance.otp,
      'box_number': instance.boxNumber,
      'delivered': instance.delivered,
      'status': instance.status,
      'Product': instance.product,
      'Location': instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
    };
