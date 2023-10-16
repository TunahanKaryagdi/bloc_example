import 'package:flutter_bloc/flutter_bloc.dart';

final class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());

  bool isSuccessful = true;

  Future<void> login(String username, String password) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 3));
    isSuccessful ? emit(LoginSuccessful()) : emit(LoginFail());
  }
}

abstract class LoginState {}

final class LoginInit extends LoginState {}

final class LoginFail extends LoginState {}

final class LoginSuccessful extends LoginState {}

final class LoginLoading extends LoginState {}
