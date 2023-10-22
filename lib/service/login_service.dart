import 'package:bloc_example/model/login_request_model.dart';
import 'package:bloc_example/service/dio_helper.dart';
import 'package:bloc_example/utils/service_enum.dart';
import 'package:dio/dio.dart';

class LoginService {
  Future<Response?> login(LoginRequestModel requestModel) async {
    try {
      var response = await DioHelper.dio
          .post(ServiceEnum.loginPath.name, data: requestModel.toJson());
      return response;
    } catch (e) {
      return null;
    }
  }
}
