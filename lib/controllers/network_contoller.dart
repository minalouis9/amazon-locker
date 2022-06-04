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

  final Map<String, dynamic> fixedHeaders = {'Accept': 'application/json'};

  NetworkController({required this.ref, required this.baseUrl}) {
   var options = BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        receiveDataWhenStatusError: true);
    _dio = Dio(options);

    // Always the last interceptor to be added, to be able to log all the changes made by previous interceptors
    if (kDebugMode) {
      _dio.interceptors.add(DioLoggingInterceptor());
    }
  }

  Future<dynamic> getData(
      {required String path,
      bool returnFormattedResponse = true,
      CancelToken? cancelToken,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? headers,
      int retryCount = 3,
      bool useBaseUrl = true}) async {
    Map<String, dynamic> data = {};
    try {
      if (headers != null) {
        fixedHeaders.addAll(headers);
      }

      String fullPath;
      if (useBaseUrl) {
        fullPath = baseUrl + path;
      } else {
        fullPath = path;
      }

      Response response = await _dio.get(fullPath,
          cancelToken: cancelToken,
          queryParameters: queryParam,
          options: Options(headers: fixedHeaders));

      data.addAll(response.data);
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
              cancelToken: cancelToken,
              queryParam: queryParam,
              headers: headers,
              retryCount: retryCount - 1,
              useBaseUrl: useBaseUrl);
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
      CancelToken? cancelToken,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? files,
      bool monitorSendProgress = false,
      bool monitorReceiveProgress = false,
      bool useBaseUrl = true}) async {
    Map<String, dynamic> data = {};
    try {
      if (headers != null) {
        fixedHeaders.addAll(headers);
      }

      String fullPath;
      if (useBaseUrl) {
        fullPath = baseUrl + path;
      } else {
        fullPath = path;
      }

      Map<String, dynamic> map = {};
      if (body != null) {
        map.addAll(body);
      }

      if (files != null) {
        map[files.keys.first] = [];
        for (MultipartFile file in files.values.first) {
          map[files.keys.first].add(file);
        }
      }

      var formData = FormData.fromMap(map);
      Response response = await _dio.post(fullPath,
          cancelToken: cancelToken,
          queryParameters: queryParam,
          data: formData,
          options: Options(headers: fixedHeaders),
          onSendProgress: monitorSendProgress ? (int sent, int total) {} : null,
          onReceiveProgress:
              monitorReceiveProgress ? (int received, int total) {} : null);

      data.addAll(response.data);
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
      CancelToken? cancelToken,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? files,
      bool useBaseUrl = true}) async {
    Map<String, dynamic> data = {};
    try {
      queryParam ??= {};

      queryParam['_method'] = 'PUT';

      if (headers != null) {
        fixedHeaders.addAll(headers);
      }

      String fullPath;
      if (useBaseUrl) {
        fullPath = baseUrl + path;
      } else {
        fullPath = path;
      }

      Map<String, dynamic> map = {};
      if (body != null) {
        map.addAll(body);
      }

      if (files != null) {
        map[files.keys.first] = [];
        for (MultipartFile file in files.values.first) {
          map[files.keys.first].add(file);
        }
      }

      var formData = FormData.fromMap(map);
      Response response = await _dio.post(fullPath,
          cancelToken: cancelToken,
          queryParameters: queryParam,
          data: formData,
          options: Options(headers: fixedHeaders));

      data.addAll(response.data);
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
      CancelToken? cancelToken,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      bool useBaseUrl = true}) async {
    Map<String, dynamic> data = {};
    try {
      if (headers != null) {
        fixedHeaders.addAll(headers);
      }

      String fullPath;
      if (useBaseUrl) {
        fullPath = baseUrl + path;
      } else {
        fullPath = path;
      }

      Response response = await _dio.delete(fullPath,
          cancelToken: cancelToken,
          queryParameters: queryParam,
          data: body,
          options: Options(headers: fixedHeaders));

      data.addAll(response.data);
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
