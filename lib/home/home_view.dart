import 'package:bloc_example/home/home_cubit.dart';
import 'package:bloc_example/model/product.dart';
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
          create: (context) => HomeCubit()..fetchItems(),
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
    if (state is HomeSuccessful) {
      return _successfulSection(state.products);
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

  ListView _successfulSection(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Text(products[index].title);
      },
    );
  }
}
