import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:chat_app/features/auth/sign_up/data/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _repo;

  SignUpCubit(this._repo) : super(SignUpInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void sighUp() async {
    emit(SignUpLoading());
    ResponseResult<UserModel> response = await _repo.signUpAndSaveUser(UserModel(name: nameController.text, email: emailController.text), passwordController.text);
    if (response is SuccessResponse<UserModel>) {
      emit(SignUpSuccess(response.data));
    } else {
      emit(SignUpFailure((response as FailureResponse).message));
    }
  }
}
