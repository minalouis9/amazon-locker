import 'package:amazon_locker/controllers/account_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountProvider = ChangeNotifierProvider<AccountController>((ref) => AccountController(ref: ref));