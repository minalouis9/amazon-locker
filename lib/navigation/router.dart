import 'dart:io';

import 'package:amazon_locker/models/orders/order_model.dart';
import 'package:amazon_locker/models/product/product_model.dart';
import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/screens/screens_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.homeScreen:
        return _navigate(const HomeScreen());
      case RoutePaths.splashScreen:
        return _navigate(const SplashScreen());

      case RoutePaths.loginScreen:
        return _navigate(const LoginScreen());
      case RoutePaths.registerScreen:
        return _navigate(const RegisterScreen());

      case RoutePaths.singleProductScreen:
        final args = settings.arguments as ProductModel;
        return _navigate(SingleProductScreen(product: args));

      case RoutePaths.locationsScreens:
        final args = settings.arguments as int;
        return _navigate(LocationScreen(productId: args));

      case RoutePaths.myOrdersScreen:
        return _navigate(const MyOrdersScreen());
      case RoutePaths.singleOrderScreen:
        final args = settings.arguments as OrderModel;
        return _navigate(SingleOrderScreen(order: args));

      case RoutePaths.allLocationsScreen:
        return _navigate(const AllLocationsScreen());

      default:
        return _navigate(const HomeScreen());
    }
  }

  static _navigate(Widget widget) {
    if (Platform.isAndroid) {
      return MaterialPageRoute(builder: (_) => widget);
    } else if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => widget);
    }
  }
}