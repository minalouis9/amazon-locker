// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BSHUserModel _$$_BSHUserModelFromJson(Map<String, dynamic> json) =>
    _$_BSHUserModel(
      id: json['id'] as int?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      token: json['token'] as String?,
      tokenType: json['tokenType'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      birthDate: json['birth_date'] as String,
      address: json['address'] as String?,
      password: json['password'] as String?,
      isVerified: json['email_verfied_at'] == null
          ? null
          : DateTime.parse(json['email_verfied_at'] as String),
      confirmPassword: json['password_confirmation'] as String?,
      oldPassword: json['old_password'] as String?,
      profilePicture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$$_BSHUserModelToJson(_$_BSHUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'token': instance.token,
      'tokenType': instance.tokenType,
      'email': instance.email,
      'phone': instance.phone,
      'gender': _$GenderEnumMap[instance.gender],
      'birth_date': instance.birthDate,
      'address': instance.address,
      'password': instance.password,
      'email_verfied_at': instance.isVerified?.toIso8601String(),
      'password_confirmation': instance.confirmPassword,
      'old_password': instance.oldPassword,
      'profile_picture': instance.profilePicture,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
