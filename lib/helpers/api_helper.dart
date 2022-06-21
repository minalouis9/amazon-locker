import 'package:amazon_locker/controllers/network_controller.dart';
import 'package:amazon_locker/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ApiHelper {
  final NetworkController networkController;

  ApiHelper({required this.networkController});

  Future login({required String email, required String password}) async {
    return networkController.postData(
        path: '/auth/login', body: {'email': email, 'password': password});
  }

  Future register(
      {required String email,
      required String password,
      required String name}) async {
    return networkController.postData(path: '/auth/register', body: {
      'email': email,
      'password': password,
      'name': name,
      'fcmToken': await FirebaseMessaging.instance.getToken()
    });
  }

  Future getAllOrders({required UserModel user}) async {
    return networkController.getData(
        path: '/app/get_orders', headers: user.toHeader());
  }

  Future getAllProducts() async {
    return networkController.getData(path: '/app/get_products');
  }

  Future getAllLocations() async {
    return networkController.getData(path: '/app/get_locations');
  }

  Future buyProduct(
      {required UserModel user,
      required int productId,
      required int locationId}) async {
    return networkController.postData(
        path: '/app/buy_product',
        headers: user.toHeader(),
        body: {'product_id': productId, 'location_id': locationId});
  }

  Future generateOtp({required UserModel user, required int orderId}) async {
    return networkController.postData(
        path: '/app/generate_otp',
        headers: user.toHeader(),
        body: {'order_id': orderId});
  }
}
