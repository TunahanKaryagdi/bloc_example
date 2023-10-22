import 'package:bloc_example/home/home_view.dart';
import 'package:bloc_example/login/login_cubit.dart';
import 'package:bloc_example/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final String _loginText = "Login";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => LoginCubit(LoginService()),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFail) {
              showBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                  child: Text(state.errorMessage),
                ),
              );
            }
            if (state is LoginSuccessful) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ));
            }
          },
          builder: (context, state) {
            return _body(context, state);
          },
        ),
      ),
    );
  }

  Column _body(BuildContext context, Object? state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        state is LoginLoading
            ? const CircularProgressIndicator()
            : const SizedBox(),
        TextField(
          controller: _emailController,
        ),
        TextField(controller: _passwordController),
        ElevatedButton(
            onPressed: () => context
                .read<LoginCubit>()
                .login(_emailController.text, _passwordController.text),
            child: Text(_loginText))
      ],
    );
  }
}
