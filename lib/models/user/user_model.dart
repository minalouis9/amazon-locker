import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum Gender { male, female }

// 3. Annotate the class with @freezed
@freezed
class BSHUserModel with _$BSHUserModel {
  const BSHUserModel._();

  const factory BSHUserModel(
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
        @JsonKey(name: 'profile_picture') String? profilePicture}) = _BSHUserModel;

  factory BSHUserModel.fromJson(Map<String, dynamic> json) =>
      _$BSHUserModelFromJson(json);

  Map<String, String> toHeader() {
    return {
      'Authorization': '$tokenType $token',
    };
  }
}