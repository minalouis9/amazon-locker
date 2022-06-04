// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BSHUserModel _$BSHUserModelFromJson(Map<String, dynamic> json) {
  return _BSHUserModel.fromJson(json);
}

/// @nodoc
class _$BSHUserModelTearOff {
  const _$BSHUserModelTearOff();

  _BSHUserModel call(
      {int? id,
      @JsonKey(name: 'first_name') required String firstName,
      @JsonKey(name: 'last_name') required String lastName,
      String? token,
      String? tokenType,
      required String email,
      String? phone,
      required Gender gender,
      @JsonKey(name: 'birth_date') required String birthDate,
      String? address,
      String? password,
      @JsonKey(name: 'email_verfied_at') DateTime? isVerified,
      @JsonKey(name: 'password_confirmation') String? confirmPassword,
      @JsonKey(name: 'old_password') String? oldPassword,
      @JsonKey(name: 'profile_picture') String? profilePicture}) {
    return _BSHUserModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      token: token,
      tokenType: tokenType,
      email: email,
      phone: phone,
      gender: gender,
      birthDate: birthDate,
      address: address,
      password: password,
      isVerified: isVerified,
      confirmPassword: confirmPassword,
      oldPassword: oldPassword,
      profilePicture: profilePicture,
    );
  }

  BSHUserModel fromJson(Map<String, Object?> json) {
    return BSHUserModel.fromJson(json);
  }
}

/// @nodoc
const $BSHUserModel = _$BSHUserModelTearOff();

/// @nodoc
mixin _$BSHUserModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get tokenType => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  String get birthDate => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verfied_at')
  DateTime? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_confirmation')
  String? get confirmPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'old_password')
  String? get oldPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture')
  String? get profilePicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BSHUserModelCopyWith<BSHUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BSHUserModelCopyWith<$Res> {
  factory $BSHUserModelCopyWith(
          BSHUserModel value, $Res Function(BSHUserModel) then) =
      _$BSHUserModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String? token,
      String? tokenType,
      String email,
      String? phone,
      Gender gender,
      @JsonKey(name: 'birth_date') String birthDate,
      String? address,
      String? password,
      @JsonKey(name: 'email_verfied_at') DateTime? isVerified,
      @JsonKey(name: 'password_confirmation') String? confirmPassword,
      @JsonKey(name: 'old_password') String? oldPassword,
      @JsonKey(name: 'profile_picture') String? profilePicture});
}

/// @nodoc
class _$BSHUserModelCopyWithImpl<$Res> implements $BSHUserModelCopyWith<$Res> {
  _$BSHUserModelCopyWithImpl(this._value, this._then);

  final BSHUserModel _value;
  // ignore: unused_field
  final $Res Function(BSHUserModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? address = freezed,
    Object? password = freezed,
    Object? isVerified = freezed,
    Object? confirmPassword = freezed,
    Object? oldPassword = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BSHUserModelCopyWith<$Res>
    implements $BSHUserModelCopyWith<$Res> {
  factory _$BSHUserModelCopyWith(
          _BSHUserModel value, $Res Function(_BSHUserModel) then) =
      __$BSHUserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String? token,
      String? tokenType,
      String email,
      String? phone,
      Gender gender,
      @JsonKey(name: 'birth_date') String birthDate,
      String? address,
      String? password,
      @JsonKey(name: 'email_verfied_at') DateTime? isVerified,
      @JsonKey(name: 'password_confirmation') String? confirmPassword,
      @JsonKey(name: 'old_password') String? oldPassword,
      @JsonKey(name: 'profile_picture') String? profilePicture});
}

/// @nodoc
class __$BSHUserModelCopyWithImpl<$Res> extends _$BSHUserModelCopyWithImpl<$Res>
    implements _$BSHUserModelCopyWith<$Res> {
  __$BSHUserModelCopyWithImpl(
      _BSHUserModel _value, $Res Function(_BSHUserModel) _then)
      : super(_value, (v) => _then(v as _BSHUserModel));

  @override
  _BSHUserModel get _value => super._value as _BSHUserModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? address = freezed,
    Object? password = freezed,
    Object? isVerified = freezed,
    Object? confirmPassword = freezed,
    Object? oldPassword = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_BSHUserModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BSHUserModel extends _BSHUserModel {
  const _$_BSHUserModel(
      {this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      this.token,
      this.tokenType,
      required this.email,
      this.phone,
      required this.gender,
      @JsonKey(name: 'birth_date') required this.birthDate,
      this.address,
      this.password,
      @JsonKey(name: 'email_verfied_at') this.isVerified,
      @JsonKey(name: 'password_confirmation') this.confirmPassword,
      @JsonKey(name: 'old_password') this.oldPassword,
      @JsonKey(name: 'profile_picture') this.profilePicture})
      : super._();

  factory _$_BSHUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_BSHUserModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String? token;
  @override
  final String? tokenType;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final Gender gender;
  @override
  @JsonKey(name: 'birth_date')
  final String birthDate;
  @override
  final String? address;
  @override
  final String? password;
  @override
  @JsonKey(name: 'email_verfied_at')
  final DateTime? isVerified;
  @override
  @JsonKey(name: 'password_confirmation')
  final String? confirmPassword;
  @override
  @JsonKey(name: 'old_password')
  final String? oldPassword;
  @override
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;

  @override
  String toString() {
    return 'BSHUserModel(id: $id, firstName: $firstName, lastName: $lastName, token: $token, tokenType: $tokenType, email: $email, phone: $phone, gender: $gender, birthDate: $birthDate, address: $address, password: $password, isVerified: $isVerified, confirmPassword: $confirmPassword, oldPassword: $oldPassword, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BSHUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      token,
      tokenType,
      email,
      phone,
      gender,
      birthDate,
      address,
      password,
      isVerified,
      confirmPassword,
      oldPassword,
      profilePicture);

  @JsonKey(ignore: true)
  @override
  _$BSHUserModelCopyWith<_BSHUserModel> get copyWith =>
      __$BSHUserModelCopyWithImpl<_BSHUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BSHUserModelToJson(this);
  }
}

abstract class _BSHUserModel extends BSHUserModel {
  const factory _BSHUserModel(
          {int? id,
          @JsonKey(name: 'first_name') required String firstName,
          @JsonKey(name: 'last_name') required String lastName,
          String? token,
          String? tokenType,
          required String email,
          String? phone,
          required Gender gender,
          @JsonKey(name: 'birth_date') required String birthDate,
          String? address,
          String? password,
          @JsonKey(name: 'email_verfied_at') DateTime? isVerified,
          @JsonKey(name: 'password_confirmation') String? confirmPassword,
          @JsonKey(name: 'old_password') String? oldPassword,
          @JsonKey(name: 'profile_picture') String? profilePicture}) =
      _$_BSHUserModel;
  const _BSHUserModel._() : super._();

  factory _BSHUserModel.fromJson(Map<String, dynamic> json) =
      _$_BSHUserModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String? get token;
  @override
  String? get tokenType;
  @override
  String get email;
  @override
  String? get phone;
  @override
  Gender get gender;
  @override
  @JsonKey(name: 'birth_date')
  String get birthDate;
  @override
  String? get address;
  @override
  String? get password;
  @override
  @JsonKey(name: 'email_verfied_at')
  DateTime? get isVerified;
  @override
  @JsonKey(name: 'password_confirmation')
  String? get confirmPassword;
  @override
  @JsonKey(name: 'old_password')
  String? get oldPassword;
  @override
  @JsonKey(name: 'profile_picture')
  String? get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$BSHUserModelCopyWith<_BSHUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
