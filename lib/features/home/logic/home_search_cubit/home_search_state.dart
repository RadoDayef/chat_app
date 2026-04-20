part of 'home_search_cubit.dart';

abstract class HomeSearchState {}

final class HomeSearchInitial extends HomeSearchState {}

final class HomeSearchLoading extends HomeSearchState {}

final class HomeSearchSuccess extends HomeSearchState {
  List<UserModel> users;

  HomeSearchSuccess(this.users);
}

final class HomeSearchFailure extends HomeSearchState {
  String message;

  HomeSearchFailure(this.message);
}
