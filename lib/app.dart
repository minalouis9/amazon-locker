import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/navigation/router.dart';
import 'package:amazon_locker/providers/app_theme_provider.dart';
import 'package:amazon_locker/providers/notification_provider.dart';
import 'package:amazon_locker/screens/screens_index.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  Future<void> initializeFirebase() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    await messaging.getToken().then((value){
      print(value);
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initializeFirebase();
  // }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider);
    ref.read(notificationProvider).init();

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
