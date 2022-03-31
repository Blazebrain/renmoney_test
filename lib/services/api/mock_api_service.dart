import 'package:dio/dio.dart';

import 'api.dart';

class MockApiService implements IApi {
  @override
  Future get(Uri uri,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken,
      Options? options,
      ProgressCallback? onReceiveProgress}) {
    throw UnimplementedError();
  }
}
