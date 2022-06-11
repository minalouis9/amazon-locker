import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'product_model.freezed.dart';
part 'product_model.g.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
@immutable
class ProductModel with _$ProductModel {
  const factory ProductModel(
      {required int id,
        @JsonKey(name: 'product_name') required String title,
        @JsonKey(name: 'product_description') required String description,
        @JsonKey(name: 'product_image') required String imageUrl,
        @JsonKey(name: 'product_price') required int price}) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}