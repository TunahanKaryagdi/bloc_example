import 'package:bloc_example/home/home_cubit.dart';
import 'package:bloc_example/model/home_response_model.dart';
import 'package:bloc_example/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  final String _home = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_home),
        ),
        body: BlocProvider(
          create: (context) => HomeCubit(HomeService())..fetchItems(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return _body(context, state);
            },
          ),
        ));
  }

  Widget _body(BuildContext context, Object? state) {
    if (state is HomeFail) {
      return _failSection(state.errorMessage);
    }
    if (state is HomeLoading) {
      return _loadingSection();
    }
    if (state is HomeItemsLoaded) {
      return _successfulSection(state.users);
    }
    return const SizedBox();
  }

  Center _failSection(String errrorMessage) {
    return Center(
      child: Text(errrorMessage),
    );
  }

  Center _loadingSection() {
    return const Center(child: CircularProgressIndicator());
  }

  ListView _successfulSection(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Text(users[index].firstName ?? "");
      },
    );
  }
}
