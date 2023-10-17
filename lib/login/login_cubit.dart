import 'package:bloc_example/model/login_request_model.dart';
import 'package:bloc_example/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginService) : super(LoginInit());

  final LoginService loginService;
  bool isSuccessful = true;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    bool isSuccess =
        await loginService.login(LoginRequestModel(email, password));
    isSuccess ? emit(LoginSuccessful()) : emit(LoginFail("an error occured"));
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
