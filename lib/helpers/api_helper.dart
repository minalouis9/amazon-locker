import 'package:amazon_locker/controllers/network_controller.dart';
import 'package:amazon_locker/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ApiHelper {
  final NetworkController networkController;

  ApiHelper({required this.networkController});

  ///////////////////////// GENERAL /////////////////////////
  Future<dynamic> performRequest(
      {required String path,
      required String method,
      CancelToken? cancelToken,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? body,
      Map<String, String?>? headers,
      Map<String, dynamic>? files,
      bool useBaseUrl = true,
      bool returnFormattedData = true,
      bool monitorSendProgress = false,
      bool monitorReceiveProgress = false}) async {
    switch (method) {
      case "GET":
        return await networkController.getData(
            path: path,
            useBaseUrl: useBaseUrl,
            returnFormattedResponse: returnFormattedData,
            cancelToken: cancelToken,
            queryParam: queryParam,
            headers: headers);
      case "POST":
        return await networkController.postData(
            path: path,
            useBaseUrl: useBaseUrl,
            returnFormattedResponse: returnFormattedData,
            cancelToken: cancelToken,
            queryParam: queryParam,
            body: body,
            headers: headers,
            files: files,
            monitorReceiveProgress: monitorReceiveProgress,
            monitorSendProgress: monitorReceiveProgress);
      case "PUT":
        return await networkController.putData(
            path: path,
            useBaseUrl: useBaseUrl,
            returnFormattedResponse: returnFormattedData,
            cancelToken: cancelToken,
            queryParam: queryParam,
            body: body,
            headers: headers,
            files: files);
      case "DELETE":
        return await networkController.deleteData(
            path: path,
            useBaseUrl: useBaseUrl,
            returnFormattedResponse: returnFormattedData,
            cancelToken: cancelToken,
            queryParam: queryParam,
            headers: headers);
      default:
        return await networkController.getData(
            path: path,
            useBaseUrl: useBaseUrl,
            returnFormattedResponse: returnFormattedData,
            cancelToken: cancelToken,
            queryParam: queryParam,
            headers: headers);
    }
  }

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
