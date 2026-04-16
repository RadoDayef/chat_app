part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  List<ChatModel> chats;

  HomeSuccess(this.chats);
}

final class HomeFailure extends HomeState {
  String message;

  HomeFailure(this.message);
}
