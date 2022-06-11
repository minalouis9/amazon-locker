import 'dart:ffi';

import 'package:amazon_locker/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logo extends ConsumerWidget {
  final double? width, height;
  const Logo({
    Key? key, this.width, this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.watch(appThemeProvider);

    return Hero(
      tag: 'logo',
      child: Image.asset(
        themeController.themeMode == ThemeMode.light
            ? 'assets/logo.png'
            : 'assets/logo1.png',
        width: width ?? 150.0,
        height: height ?? 150.0,
      ),
    );
  }
}
