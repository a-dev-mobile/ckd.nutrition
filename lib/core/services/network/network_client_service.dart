import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrition/core/log/log.dart';

final networkClientProvider = Provider<NetworkClientService>((ref) {
  return NetworkClientService();
});

class NetworkClientService {
  NetworkClientService()
      : _dio = Dio(
          BaseOptions(
            connectTimeout: 30000,
            receiveTimeout: 30000,
          ),
        )..interceptors.addAll([
            DioLogInterceptor(),
            // NoInternetInterceptor(
            //     _router.router.routerDelegate.navigatorKey.currentContext!),
          ]);

  final Dio _dio;
  Dio get client => _dio;

// ignore: avoid_setters_without_getters
  set isShowHttpInLog(bool value) => DioLogInterceptor.enablePrintLog = value;

  Future<Response<dynamic>> request({
    required Method method,
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
    dynamic body,
  }) async {
    try {
      if (method == Method.post) {
        return await client.post<dynamic>(
          url,
          queryParameters: params,
          options: Options(headers: header),
          data: body,
        );
      } else if (method == Method.get) {
        return await client.get<dynamic>(
          url,
          queryParameters: params,
          options: Options(headers: header),
        );
      } else if (method == Method.patch) {
        return await client.patch<dynamic>(
          url,
          queryParameters: params,
          options: Options(headers: header),
          data: body,
        );
      }
    } on DioError catch (e) {
      logger.e(e.message, e.error, e.stackTrace);

      return e.response!;
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }

    return Response(
      requestOptions: RequestOptions(path: ''),
    );
  }
}

/// {@template network_client}
/// Method enumeration
/// {@endtemplate}
enum Method with Comparable<Method> {
  /// post method
  post('post'),

  /// get method
  get('get'),

  /// patch_getStarted
  patch('patch');

  /// {@macro network_client}
  const Method(this.value);

  /// Creates a new instance of [Method] from a given string.
  static Method fromValue(String? value, {Method? fallback}) {
    switch (value) {
      case 'post':
        return post;
      case 'get':
        return get;
      case 'patch':
        return patch;
      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Value of the enum
  final String value;

  /// Pattern matching
  T map<T>({
    required T Function() post,
    required T Function() get,
    required T Function() patch,
  }) {
    switch (this) {
      case Method.post:
        return post();
      case Method.get:
        return get();
      case Method.patch:
        return patch();
    }
  }

  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? post,
    T Function()? get,
    T Function()? patch,
  }) =>
      map<T>(
        post: post ?? orElse,
        get: get ?? orElse,
        patch: patch ?? orElse,
      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? post,
    T Function()? get,
    T Function()? patch,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        post: post,
        get: get,
        patch: patch,
      );

  @override
  int compareTo(Method other) => index.compareTo(other.index);

  @override
  String toString() => value;
}
