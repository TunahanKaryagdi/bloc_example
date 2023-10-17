import 'package:bloc_example/model/login_request_model.dart';
import 'package:bloc_example/service/dio_helper.dart';
import 'package:bloc_example/utils/service_enum.dart';

class LoginService {
  Future<bool> login(LoginRequestModel requestModel) async {
    var response = await DioHelper.dio
        .post(ServiceEnum.loginPath.name, data: requestModel);
    if ((response.statusCode != null) &&
        (response.statusCode! > 199 || response.statusCode! < 300)) {
      return true;
    }
    return false;
  }
}
