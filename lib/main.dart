import 'dart:io';

import 'package:amazon_locker/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [_firebaseMessagingBackgroundHandler]
/// Global function that handles background messages
/// Adds the new notification to the notifications database
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize firebase
  await Firebase.initializeApp();
}

void main() async {
  // Initialize firebase app
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // // Setup background notifications for iOS
  // if (Platform.isIOS) {
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // }

  runApp(const ProviderScope(child: MyApp()));
}