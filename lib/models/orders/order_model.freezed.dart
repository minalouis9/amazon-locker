// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
class _$OrderModelTearOff {
  const _$OrderModelTearOff();

  _OrderModel call(
      {required int id,
      required String otp,
      @JsonKey(name: 'box_number')
          int? boxNumber,
      required bool delivered,
      required String status,
      @JsonKey(name: 'Product')
          required ProductModel product,
      @JsonKey(name: 'Location', fromJson: fromOrderLocationJson)
          required LocationModel location,
      required DateTime createdAt}) {
    return _OrderModel(
      id: id,
      otp: otp,
      boxNumber: boxNumber,
      delivered: delivered,
      status: status,
      product: product,
      location: location,
      createdAt: createdAt,
    );
  }

  OrderModel fromJson(Map<String, Object?> json) {
    return OrderModel.fromJson(json);
  }
}

/// @nodoc
const $OrderModel = _$OrderModelTearOff();

/// @nodoc
mixin _$OrderModel {
  int get id => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  @JsonKey(name: 'box_number')
  int? get boxNumber => throw _privateConstructorUsedError;
  bool get delivered => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Product')
  ProductModel get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location', fromJson: fromOrderLocationJson)
  LocationModel get location => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String otp,
      @JsonKey(name: 'box_number')
          int? boxNumber,
      bool delivered,
      String status,
      @JsonKey(name: 'Product')
          ProductModel product,
      @JsonKey(name: 'Location', fromJson: fromOrderLocationJson)
          LocationModel location,
      DateTime createdAt});

  $ProductModelCopyWith<$Res> get product;
  $LocationModelCopyWith<$Res> get location;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  final OrderModel _value;
  // ignore: unused_field
  final $Res Function(OrderModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? otp = freezed,
    Object? boxNumber = freezed,
    Object? delivered = freezed,
    Object? status = freezed,
    Object? product = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      boxNumber: boxNumber == freezed
          ? _value.boxNumber
          : boxNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      delivered: delivered == freezed
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }

  @override
  $LocationModelCopyWith<$Res> get location {
    return $LocationModelCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) then) =
      __$OrderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String otp,
      @JsonKey(name: 'box_number')
          int? boxNumber,
      bool delivered,
      String status,
      @JsonKey(name: 'Product')
          ProductModel product,
      @JsonKey(name: 'Location', fromJson: fromOrderLocationJson)
          LocationModel location,
      DateTime createdAt});

  @override
  $ProductModelCopyWith<$Res> get product;
  @override
  $LocationModelCopyWith<$Res> get location;
}

/// @nodoc
class __$OrderModelCopyWithImpl<$Res> extends _$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(
      _OrderModel _value, $Res Function(_OrderModel) _then)
      : super(_value, (v) => _then(v as _OrderModel));

  @override
  _OrderModel get _value => super._value as _OrderModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? otp = freezed,
    Object? boxNumber = freezed,
    Object? delivered = freezed,
    Object? status = freezed,
    Object? product = freezed,
    Object? location = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_OrderModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      boxNumber: boxNumber == freezed
          ? _value.boxNumber
          : boxNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      delivered: delivered == freezed
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel implements _OrderModel {
  const _$_OrderModel(
      {required this.id,
      required this.otp,
      @JsonKey(name: 'box_number')
          this.boxNumber,
      required this.delivered,
      required this.status,
      @JsonKey(name: 'Product')
          required this.product,
      @JsonKey(name: 'Location', fromJson: fromOrderLocationJson)
          required this.location,
      required this.createdAt});

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  final int id;
  @override
  final String otp;
  @override
  @JsonKey(name: 'box_number')
  final int? boxNumber;
  @override
  final bool delivered;
  @override
  final String status;
  @override
  @JsonKey(name: 'Product')
  final ProductModel product;
  @override
  @JsonKey(name: 'Location', fromJson: fromOrderLocationJson)
  final LocationModel location;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'OrderModel(id: $id, otp: $otp, boxNumber: $boxNumber, delivered: $delivered, status: $status, product: $product, location: $location, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.boxNumber, boxNumber) ||
                other.boxNumber == boxNumber) &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, otp, boxNumber, delivered,
      status, product, location, createdAt);

  @JsonKey(ignore: true)
  @override
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(this);
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {required int id,
      required String otp,
      @JsonKey(name: 'box_number')
          int? boxNumber,
      required bool delivered,
      required String status,
      @JsonKey(name: 'Product')
          required ProductModel product,
      @JsonKey(name: 'Location', fromJson: fromOrderLocationJson)
          required LocationModel location,
      required DateTime createdAt}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  int get id;
  @override
  String get otp;
  @override
  @JsonKey(name: 'box_number')
  int? get boxNumber;
  @override
  bool get delivered;
  @override
  String get status;
  @override
  @JsonKey(name: 'Product')
  ProductModel get product;
  @override
  @JsonKey(name: 'Location', fromJson: fromOrderLocationJson)
  LocationModel get location;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
