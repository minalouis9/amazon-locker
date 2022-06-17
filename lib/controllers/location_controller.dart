import 'package:amazon_locker/models/location/location_model.dart';
import 'package:amazon_locker/models/response/response_model.dart';
import 'package:amazon_locker/models/states/general_state/general_state.dart';
import 'package:amazon_locker/providers/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationController extends StateNotifier<GeneralState>{
  final Ref ref;
  LocationController({required this.ref, GeneralState state = const GeneralState.loading()}):super(state);

  List<LocationModel> locations = [];

  Future getAllLocations() async {
    state = const GeneralState.loading();
    try{
      final ResponseModel response = await ref.read(apiProvider).getAllLocations();
      if(response.statusCode == 200){
        state = GeneralState.data((response.data! as List).map((e) => LocationModel.fromJson(e)).toList());
      }else{
        throw response.error!;
      }
    }catch(e){
      state = GeneralState.error(e.toString());
    }
  }
}