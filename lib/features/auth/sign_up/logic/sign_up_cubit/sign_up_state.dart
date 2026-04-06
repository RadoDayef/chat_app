part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  UserModel user;

  SignUpSuccess(this.user);
}

final class SignUpFailure extends SignUpState {
  String message;

  SignUpFailure(this.message);
}
