import 'package:bloc_example/model/home_response_model.dart';
import 'package:bloc_example/service/home_service.dart';
import 'package:bloc_example/utils/status_code_enum.dart';
import 'package:bloc_example/utils/status_code_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeService) : super(HomeLoading());

  final HomeService _homeService;

  bool isSuccessful = true;

  Future<void> fetchItems() async {
    var response = await _homeService.getAll();
    if (response == null) {
      emit(HomeFail(StatusCode.unknown.name));
      return;
    }
    if (response.statusCode.httpStatusCode == StatusCode.ok) {
      HomeResponseModel homeResponse =
          HomeResponseModel.fromJson(response.data);
      emit(HomeItemsLoaded(homeResponse.data ?? []));
      return;
    }

    emit(HomeFail(response.statusCode.httpStatusCode.name));
  }
}

abstract class HomeState {}

final class HomeInit extends HomeState {}

final class HomeItemsLoaded extends HomeState {
  HomeItemsLoaded(this.users);
  final List<User> users;
}

final class HomeFail extends HomeState {
  HomeFail(this.errorMessage);
  final String errorMessage;
}

final class HomeLoading extends HomeState {}
