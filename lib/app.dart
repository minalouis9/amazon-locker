import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/navigation/router.dart';
import 'package:amazon_locker/providers/app_theme_provider.dart';
import 'package:amazon_locker/screens/screens_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider);

    return MaterialApp(
      title: '',

      themeMode: appTheme.themeMode,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,

      // Navigation
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutePaths.splashScreen,
      navigatorKey: navigatorKey,

      home: const SplashScreen(),
    );
  }
}
