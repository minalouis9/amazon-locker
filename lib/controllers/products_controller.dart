import 'package:amazon_locker/models/product/product_model.dart';
import 'package:amazon_locker/models/response/response_model.dart';
import 'package:amazon_locker/models/states/general_state/general_state.dart';
import 'package:amazon_locker/providers/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsController extends StateNotifier<GeneralState>{
  final Ref ref;
  ProductsController({required this.ref, GeneralState state = const GeneralState.loading()}):super(state);

  List<ProductModel> models = [];

  Future getAllProducts() async {
    state = const GeneralState.loading();
    try{
      final ResponseModel response = await ref.read(apiProvider).getAllProducts();
      if(response.statusCode == 200){
        models.addAll((response.data! as List).map((e) => ProductModel.fromJson(e)).toList());
        state = GeneralState.data(models);
      }else{
        throw response.error!;
      }
    }catch(e){
      state = GeneralState.error(e.toString());
    }
  }
}