import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart' as dio_client;
import 'package:flutter/foundation.dart';
import 'package:renmoney_test/app/app.locator.dart';
import 'package:renmoney_test/app/app.logger.dart';
import 'package:renmoney_test/utils/constants/api_constants.dart';
import 'package:renmoney_test/utils/enum.dart';
import 'package:stacked_services/stacked_services.dart';

import 'api.dart';

class ApiService extends ChangeNotifier implements IApi {
  final log = getLogger('ApiService');
  final _snackbarService = locator<SnackbarService>();
  late final dio_client.Dio dio;

  ApiService() {
    _createDio();
    log.i('API service initialized');
  }

  dio_client.Dio _createDio() {
    dio = dio_client.Dio();
    dio
      ..options.baseUrl = ApiConstants.renmoneyBaseUri.toString()
      ..options.connectTimeout = ApiConstants.connectTimeout
      ..options.sendTimeout = ApiConstants.sendTimeout
      ..options.responseType = dio_client.ResponseType.json
      ..options.receiveTimeout = ApiConstants.receiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    if (kDebugMode) {
      dio.interceptors.add(dio_client.LogInterceptor(
          logPrint: (print) {
            log.i(print);
          },
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true));

      dio.interceptors.add(
        dio_client.InterceptorsWrapper(
          onRequest: (dio_client.RequestOptions options,
              dio_client.RequestInterceptorHandler handler) async {
            return handler.next(options);
          },
          onResponse: (dio_client.Response response,
              dio_client.ResponseInterceptorHandler handler) {
            return handler.next(response);
          },
          onError: (dio_client.DioError e,
              dio_client.ErrorInterceptorHandler handler) async {
            return handler.next(e);
          },
        ),
      );
    }

    return dio;
  }

  void _throwOnFail(dio_client.Response response) {
    if (!response.statusCode.toString().contains('20')) {
      final failure = Failure.fromHttpErrorMap(json.decode(response.data));
      throw failure;
    }
  }

  ///method to make a GET request to an API Endpoint
  @override
  Future get(Uri uri,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dio_client.CancelToken? cancelToken,
      dio_client.Options? options,
      dio_client.ProgressCallback? onReceiveProgress}) async {
    return await _performRequest(
      dio.get(
        uri.toString(),
        queryParameters: queryParameters,
        options: options ?? dio_client.Options(headers: headers),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  /// Try/catch to wrap api calls.
  /// Also gives us a single point of
  /// truth from where our API calls happen
  Future _performRequest(Future<dio_client.Response<dynamic>> apiCall) async {
    try {
      final response = await apiCall;
      _throwOnFail(response);
      return response.data;
    } on dio_client.DioError catch (e) {
      if (e.message.contains('SocketException') ||
          e.message.contains('timed out')) {
        _snackbarService.showCustomSnackBar(
          message: 'Internet Connection Error.',
          title: 'Error',
          variant: SnackBarType.error,
          duration: const Duration(seconds: 2),
        );
      }
      log.e(e.type.toString());
      log.e(e.error);
      log.e(e.response.toString());
      log.e(e.response?.statusMessage);
      log.e(e.response?.data);

      throw Failure(
        message: e.message,
        data: json.decode(e.response.toString()),
      );
    } catch (e) {
      log.e(e);
      throw Failure(
        message: e.toString(),
      );
    }
  }
}

class Failure {
  final String message;
  final Map<String, dynamic>? data;

  Failure({
    required this.message,
    this.data,
  });

  factory Failure.fromHttpErrorMap(Map<String, dynamic> json) => Failure(
        message: json["error"]["message"],
        data: json["data"],
      );

  @override
  String toString() {
    return 'Failure{message: $message, data: $data}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          data == other.data;

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
