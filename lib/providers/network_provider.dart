
import 'package:amazon_locker/controllers/network_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkProvider = Provider(
        (ref) => NetworkController(ref: ref, baseUrl: 'https://locker.fekry.dev'));