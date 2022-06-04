// 1. Import this:
import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'general_state.freezed.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
class GeneralState with _$GeneralState {
  // 5. Create a `const factory` constructor for each valid state
  const factory GeneralState.loading() = _Loading;
  const factory GeneralState.error(String errorText) = _Error;
  const factory GeneralState.data(dynamic data) = _Data;
}