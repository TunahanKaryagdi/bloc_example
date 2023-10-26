import 'package:bloc_example/utils/service_enum.dart';
import 'package:dio/dio.dart';

final class DioHelper {
  static Dio? _dio;

  static Dio get dio {
    _dio ??= Dio(BaseOptions(baseUrl: ServiceEnum.baseUrl.name));
    return _dio!;
  }
}
