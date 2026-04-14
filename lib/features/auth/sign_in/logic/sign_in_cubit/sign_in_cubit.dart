import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/features/auth/sign_in/data/sign_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInRepo _repo;

  SignInCubit(this._repo) : super(SignInInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() async {
    emit(SignInLoading());
    ResponseResult<User> response = await _repo.signInWithEmail(emailController.text, passwordController.text);
    if (response is SuccessResponse<User>) {
      if (response.data.emailVerified) {
        emit(SignInSuccess());
      } else {
        emit(SignInFailure("Email not verified"));
      }
    } else {
      emit(SignInFailure((response as FailureResponse).message));
    }
  }
}
