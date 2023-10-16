import 'package:bloc_example/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  bool isSuccessful = true;

  Future<void> fetchItems() async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 3));
    isSuccessful ? emit(HomeSuccessful(getProducts())) : emit(HomeFail("daf"));
  }
}

abstract class HomeState {}

final class HomeInit extends HomeState {}

final class HomeSuccessful extends HomeState {
  HomeSuccessful(this.products);
  final List<Product> products;
}

final class HomeFail extends HomeState {
  HomeFail(this.errorMessage);
  final String errorMessage;
}

final class HomeLoading extends HomeState {}
