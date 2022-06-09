import 'package:amazon_locker/controllers/theme_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = ChangeNotifierProvider<AppThemeController>((ref) => AppThemeController());