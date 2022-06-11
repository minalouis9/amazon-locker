import 'package:amazon_locker/controllers/notification_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationProvider = ChangeNotifierProvider<NotificationController>(
        (ref) => NotificationController());