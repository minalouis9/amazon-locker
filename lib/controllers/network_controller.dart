import 'dart:convert';
import 'dart:io';

import 'package:amazon_locker/helpers/dio_log_interceptor.dart';
import 'package:amazon_locker/models/response/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkController {
  final Ref ref;
  final String baseUrl;

  late Dio _dio;

  final Map<String, dynamic> fixedHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  NetworkController({required this.ref, required this.baseUrl}) {
    var options = BaseOptions(receiveDataWhenStatusError: true);
    _dio = Dio(options);

    // Always the last interceptor to be added, to be able to log all the changes made by previous interceptors
    // if (kDebugMode) {
    //   _dio.interceptors.add(DioLoggingInterceptor());
    // }
  }

  Future<dynamic> getData(
      {required String path,
      bool returnFormattedResponse = true,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? headers,
      int retryCount = 3}) async {
    Map<String, dynamic> data = {};
    try {
      if (headers != null) {
        fixedHeaders.addAll(headers);
      }

      String fullPath = baseUrl + path;

      Response response = await _dio.get(fullPath,
          queryParameters: queryParam, options: Options(headers: fixedHeaders));

      data['data'] = response.data;
      data['statusCode'] = response.statusCode;

      if (returnFormattedResponse) {
        return ResponseModel.fromJson(data);
      } else {
        return response;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        // Connect and receive timeout errors
        if (retryCount > 0) {
          return await getData(
              path: path,
              queryParam: queryParam,
              headers: headers,
              retryCount: retryCount - 1);
        }
        return const ResponseModel(
          message: 'Connection Timeout, please try again later',
          statusCode: 0,
        );
      } else {
        if (e.error is SocketException) {
          // No internet connection
          return const ResponseModel(
            message: 'No internet connection found',
            statusCode: 0,
          );
        }
      }
      // Any other error
      data.addAll(e.response!.data);
      data['statusCode'] = e.response!.statusCode;
      return ResponseModel.fromJson(data);
    }
  }

  // TODO: modify the rest of the requests
  Future<dynamic> postData(
      {required String path,
      bool returnFormattedResponse = true,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? files,
      bool monitorSendProgress = false,
      bool monitorReceiveProgress = false}) async {
    Map<String, dynamic> data = {};
    try {
      if (headers != null) {
        fixedHeaders.addAll(headers);
      }

      String fullPath = baseUrl + path;

      Map<String, dynamic> map = {};
      if (body != null) {
        map.addAll(body);
      }

      Response response = await _dio.post(fullPath,
          queryParameters: queryParam,
          data: jsonEncode(map),
          options: Options(headers: fixedHeaders),
          onSendProgress: monitorSendProgress ? (int sent, int total) {} : null,
          onReceiveProgress:
              monitorReceiveProgress ? (int received, int total) {} : null);

      data['data'] = response.data;
      data['statusCode'] = response.statusCode;

      if (returnFormattedResponse) {
        return ResponseModel.fromJson(data);
      } else {
        return response;
      }
    } on DioError catch (e) {
      data.addAll(e.response!.data);
      data['statusCode'] = e.response!.statusCode;
      return ResponseModel.fromJson(data);
    }
  }

  Future<dynamic> putData(
      {required String path,
      bool returnFormattedResponse = true,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? files}) async {
    Map<String, dynamic> data = {};
    try {
      queryParam ??= {};

      if (headers != null) {
        fixedHeaders.addAll(headers);
      }

      String fullPath = baseUrl + path;

      Map<String, dynamic> map = {};
      if (body != null) {
        map.addAll(body);
      }

      Response response = await _dio.put(fullPath,
          queryParameters: queryParam,
          data: jsonEncode(map),
          options: Options(headers: fixedHeaders));

      data['data'] = response.data;
      data['statusCode'] = response.statusCode;

      if (returnFormattedResponse) {
        return ResponseModel.fromJson(data);
      } else {
        return response;
      }
    } on DioError catch (e) {
      data.addAll(e.response!.data);
      data['statusCode'] = e.response!.statusCode;
      return ResponseModel.fromJson(data);
    }
  }

  Future<dynamic> deleteData(
      {required String path,
      bool returnFormattedResponse = true,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    Map<String, dynamic> data = {};
    try {
      if (headers != null) {
        fixedHeaders.addAll(headers);
      }

      String fullPath = baseUrl + path;

      Response response = await _dio.delete(fullPath,
          queryParameters: queryParam,
          data: jsonEncode(body),
          options: Options(headers: fixedHeaders));

      data['data'] = response.data;
      data['statusCode'] = response.statusCode;

      if (returnFormattedResponse) {
        return ResponseModel.fromJson(data);
      } else {
        return response;
      }
    } on DioError catch (e) {
      data.addAll(e.response!.data);
      data['statusCode'] = e.response!.statusCode;
      return ResponseModel.fromJson(data);
    }
  }
}
