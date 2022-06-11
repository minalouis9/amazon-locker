import 'package:amazon_locker/models/location/location_model.dart';
import 'package:amazon_locker/models/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'order_model.freezed.dart';

part 'order_model.g.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
@immutable
class OrderModel with _$OrderModel {
  const factory OrderModel(
          {required int id,
          required String otp,
          @JsonKey(name: 'box_number') int? boxNumber,
          required bool delivered,
          required String status,
          @JsonKey(name: 'Product') required ProductModel product,
          @JsonKey(name: 'Location', fromJson: fromOrderLocationJson) required LocationModel location,
          required DateTime createdAt}) =
      _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

LocationModel fromOrderLocationJson(Map json){
  return LocationModel(
    id: json['id'] as int,
    name: json['name'] as String,
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
    active: boolToInt(json['active'] as bool),
  );
}

int boolToInt(bool value){
  if(value){
    return 1;
  }else{
    return 0;
  }
}
