import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'response_model.freezed.dart';
part 'response_model.g.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
@immutable
class ResponseModel with _$ResponseModel {
  const factory ResponseModel(
      {String? message,
        int? statusCode,
        dynamic data,
        String? error}) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}