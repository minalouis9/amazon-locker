// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  return _ResponseModel.fromJson(json);
}

/// @nodoc
class _$ResponseModelTearOff {
  const _$ResponseModelTearOff();

  _ResponseModel call(
      {required String? message,
      int? statusCode,
      Map<String, dynamic>? data,
      Map<String, dynamic>? error}) {
    return _ResponseModel(
      message: message,
      statusCode: statusCode,
      data: data,
      error: error,
    );
  }

  ResponseModel fromJson(Map<String, Object?> json) {
    return ResponseModel.fromJson(json);
  }
}

/// @nodoc
const $ResponseModel = _$ResponseModelTearOff();

/// @nodoc
mixin _$ResponseModel {
  String? get message => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  Map<String, dynamic>? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseModelCopyWith<ResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseModelCopyWith<$Res> {
  factory $ResponseModelCopyWith(
          ResponseModel value, $Res Function(ResponseModel) then) =
      _$ResponseModelCopyWithImpl<$Res>;
  $Res call(
      {String? message,
      int? statusCode,
      Map<String, dynamic>? data,
      Map<String, dynamic>? error});
}

/// @nodoc
class _$ResponseModelCopyWithImpl<$Res>
    implements $ResponseModelCopyWith<$Res> {
  _$ResponseModelCopyWithImpl(this._value, this._then);

  final ResponseModel _value;
  // ignore: unused_field
  final $Res Function(ResponseModel) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? statusCode = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$ResponseModelCopyWith<$Res>
    implements $ResponseModelCopyWith<$Res> {
  factory _$ResponseModelCopyWith(
          _ResponseModel value, $Res Function(_ResponseModel) then) =
      __$ResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? message,
      int? statusCode,
      Map<String, dynamic>? data,
      Map<String, dynamic>? error});
}

/// @nodoc
class __$ResponseModelCopyWithImpl<$Res>
    extends _$ResponseModelCopyWithImpl<$Res>
    implements _$ResponseModelCopyWith<$Res> {
  __$ResponseModelCopyWithImpl(
      _ResponseModel _value, $Res Function(_ResponseModel) _then)
      : super(_value, (v) => _then(v as _ResponseModel));

  @override
  _ResponseModel get _value => super._value as _ResponseModel;

  @override
  $Res call({
    Object? message = freezed,
    Object? statusCode = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_ResponseModel(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseModel implements _ResponseModel {
  const _$_ResponseModel(
      {required this.message, this.statusCode, this.data, this.error});

  factory _$_ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseModelFromJson(json);

  @override
  final String? message;
  @override
  final int? statusCode;
  @override
  final Map<String, dynamic>? data;
  @override
  final Map<String, dynamic>? error;

  @override
  String toString() {
    return 'ResponseModel(message: $message, statusCode: $statusCode, data: $data, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      statusCode,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ResponseModelCopyWith<_ResponseModel> get copyWith =>
      __$ResponseModelCopyWithImpl<_ResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseModelToJson(this);
  }
}

abstract class _ResponseModel implements ResponseModel {
  const factory _ResponseModel(
      {required String? message,
      int? statusCode,
      Map<String, dynamic>? data,
      Map<String, dynamic>? error}) = _$_ResponseModel;

  factory _ResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ResponseModel.fromJson;

  @override
  String? get message;
  @override
  int? get statusCode;
  @override
  Map<String, dynamic>? get data;
  @override
  Map<String, dynamic>? get error;
  @override
  @JsonKey(ignore: true)
  _$ResponseModelCopyWith<_ResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
