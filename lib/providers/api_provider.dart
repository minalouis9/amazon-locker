import 'package:amazon_locker/helpers/api_helper.dart';
import 'package:amazon_locker/providers/network_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<ApiHelper>((ref) => ApiHelper(
    networkController: ref.watch(networkProvider)));