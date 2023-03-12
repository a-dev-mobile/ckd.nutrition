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
            connectTimeout: 3000,
            receiveTimeout: 5000,
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

  /// Sends an HTTP request using the given method, URL, parameters, headers, and body.
  ///
  /// Returns a Future that completes with the server's response.
  ///
  /// Throws a [DioError] if the request fails.
  Future<Response<T>> request<T>({
    required Method method,
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      switch (method) {
        case Method.get:
          return await client.get(
            url,
            queryParameters: params,
            options: Options(headers: headers),
          );
        case Method.post:
          return await client.post(
            url,
            queryParameters: params,
            options: Options(headers: headers),
            data: body,
          );
        case Method.patch:
          return await client.patch(
            url,
            queryParameters: params,
            options: Options(headers: headers),
            data: body,
          );
      }
    } on DioError catch (e) {
      logger.e(e.message, e.error, e.stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      logger.e(e, '', stackTrace);
      rethrow;
    }
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
