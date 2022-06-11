// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int,
      title: json['product_name'] as String,
      description: json['product_description'] as String,
      imageUrl: json['product_image'] as String,
      price: json['product_price'] as int,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.title,
      'product_description': instance.description,
      'product_image': instance.imageUrl,
      'product_price': instance.price,
    };
