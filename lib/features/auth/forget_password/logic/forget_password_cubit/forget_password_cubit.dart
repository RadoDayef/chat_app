import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/features/auth/forget_password/data/forget_password_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _repo;

  ForgetPasswordCubit(this._repo) : super(ForgetPasswordInitial());

  TextEditingController emailController = TextEditingController();

  void forgetPassword() async {
    emit(ForgetPasswordLoading());
    ResponseResult<bool> response = await _repo.sentResetPassword(emailController.text);
    if (response is SuccessResponse<bool>) {
      emit(ForgetPasswordSuccess());
    } else {
      emit(ForgetPasswordFailure((response as FailureResponse).message));
    }
  }
}
