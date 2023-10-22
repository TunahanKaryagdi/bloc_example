import 'package:bloc_example/service/dio_helper.dart';
import 'package:bloc_example/utils/service_enum.dart';
import 'package:dio/dio.dart';

class HomeService {
  Future<Response?> getAll() async {
    try {
      var response = await DioHelper.dio.get(ServiceEnum.homePath.name);
      return response;
    } catch (e) {
      return null;
    }
  }
}
