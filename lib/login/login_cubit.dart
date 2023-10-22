import 'package:bloc_example/model/login_request_model.dart';
import 'package:bloc_example/service/login_service.dart';
import 'package:bloc_example/utils/status_code_enum.dart';
import 'package:bloc_example/utils/status_code_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginService) : super(LoginInit());

  final LoginService _loginService;

  Future<void> login(String email, String password) async {
    var response = await _loginService
        .login(LoginRequestModel(email: email, password: password));

    if (response == null) {
      emit(LoginFail(StatusCode.unknown.name));
      return;
    }

    if (response.statusCode.httpStatusCode == StatusCode.ok) {
      emit(LoginSuccessful());
    } else {
      emit(LoginFail(response.statusCode.httpStatusCode.name));
    }
  }
}

abstract class LoginState {}

final class LoginInit extends LoginState {}

final class LoginFail extends LoginState {
  final String errorMessage;

  LoginFail(this.errorMessage);
}

final class LoginSuccessful extends LoginState {}

final class LoginLoading extends LoginState {}
