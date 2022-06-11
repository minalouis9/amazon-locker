import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mutex/mutex.dart';

/// [_firebaseMessagingBackgroundHandler]
/// Global function that handles background messages
/// Adds the new notification to the notifications database
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize firebase
  await Firebase.initializeApp();
}

class NotificationController extends ChangeNotifier {
  NotificationController();

  static Mutex mutex = Mutex();

  /// Firebase messaging instance
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  /// [init]
  /// Initializes the permissions, listeners and interactive message
  Future<void> init() async {
    // set foreground notification presentation
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    initLocalNotifications();

    // Initialize message handlers
    await firebaseCloudMessagingListeners();

    // Run code required to handle interacted messages
    await setupInteractedMessageAndInitialize();
  }

  Future<void> initLocalNotifications() async {
    // Initialize local notifications
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings();
    const MacOSInitializationSettings initializationSettingsMacOS =
    MacOSInitializationSettings();
    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    const AndroidNotificationChannel kChannel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // name
      description: 'This channel is used for important notifications.',
      // description
      importance: Importance.max,
    );

    // Create notification channel for Android
    await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(kChannel);
  }

  /// [setupInteractedMessageAndInitialize]
  /// Get any messages which caused the application to open from
  /// a terminated state.
  Future<void> setupInteractedMessageAndInitialize() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
  }

  /// [firebaseCloudMessagingListeners]
  /// Initializes the notifications events callbacks
  Future<void> firebaseCloudMessagingListeners() async {
    FirebaseMessaging.instance.getToken().then((token) {
      debugPrint(token);
    });

    // background notifications handling
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // foreground notifications handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

      if (Platform.isAndroid) {
        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (message.notification != null &&
            message.notification?.android != null) {
          FlutterLocalNotificationsPlugin().show(
            message.notification.hashCode,
            message.notification!.title,
            message.notification!.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                'high_importance_channel', // id
                'High Importance Notifications', // title
                channelDescription:
                'This channel is used for important notifications.',
                // description
                icon: message.notification!.android!.smallIcon,
              ),
            ),
          );
        }
      }
    });

    Stream<String> fcmStream = _firebaseMessaging.onTokenRefresh;
    fcmStream.listen((token) async {});
  }
}