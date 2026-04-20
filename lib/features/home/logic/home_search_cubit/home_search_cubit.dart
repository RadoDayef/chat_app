import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:chat_app/features/home/data/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_search_state.dart';

class HomeSearchCubit extends Cubit<HomeSearchState> {
  final HomeRepo _repo;

  HomeSearchCubit(this._repo) : super(HomeSearchInitial());
  TextEditingController searchController = TextEditingController();

  void searchForUser() async {
    emit(HomeSearchLoading());
    if (searchController.text.isNotEmpty) {
      ResponseResult<List<UserModel>> response = await _repo.searchForUser(searchController.text);
      if (response is SuccessResponse<List<UserModel>>) {
        if (response.data.isEmpty) {
          emit(HomeSearchFailure("No users found"));
        } else {
          emit(HomeSearchSuccess(response.data));
        }
      } else {
        emit(HomeSearchFailure((response as FailureResponse).message));
      }
    } else {
      Future.microtask(() => emit(HomeSearchInitial()));
    }
  }
}
