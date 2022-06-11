import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'user_model.freezed.dart';
part 'user_model.g.dart';

// 3. Annotate the class with @freezed
@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel(
      {@JsonKey(name: 'user_id') int? id,
        @JsonKey(name: 'name') required String name,
        @JsonKey(name: 'access_token') String? token,
        required String email,
        String? password}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, String> toHeader() {
    return {
      'Authorization': 'Bearer $token',
    };
  }
}