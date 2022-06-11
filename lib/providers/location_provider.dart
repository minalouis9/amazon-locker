import 'package:amazon_locker/controllers/location_controller.dart';
import 'package:amazon_locker/models/states/general_state/general_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationsProvider = StateNotifierProvider<LocationController, GeneralState>((ref) => LocationController(ref: ref));