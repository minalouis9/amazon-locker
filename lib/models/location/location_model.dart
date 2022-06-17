import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'location_model.freezed.dart';
part 'location_model.g.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
@immutable
class LocationModel with _$LocationModel {
  const factory LocationModel(
      {required int id,
        required String name,
        required double lat,
        required double lng,
        required int active, required int lockersCount, required int remainingLockers}) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}