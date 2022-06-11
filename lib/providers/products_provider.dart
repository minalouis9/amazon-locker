import 'package:amazon_locker/controllers/products_controller.dart';
import 'package:amazon_locker/models/states/general_state/general_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = StateNotifierProvider<ProductsController, GeneralState>((ref) => ProductsController(ref: ref));