import 'dart:io';

import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:chat_app/features/auth/sign_up/data/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _repo;

  SignUpCubit(this._repo) : super(SignUpInitial());

  File? image;
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  void signUp() async {
    emit(SignUpLoading());
    String imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOtu74pEiq7ofeQeTsco0migV16zZoBwSlGg&s";
    if (image != null) {
      ResponseResult<String> imageResponse = await _repo.uploadImageToSupabase(image!);
      if (imageResponse is SuccessResponse<String>) {
        imageUrl = imageResponse.data;
      } else {
        emit(SignUpFailure((imageResponse as FailureResponse).message));
        return;
      }
    }

    ResponseResult<bool> response = await _repo.signUpAndSaveUser(
      UserModel(name: "${firstNameController.text} ${lastNameController.text}", email: emailController.text, imageUrl: imageUrl),
      passwordController.text,
    );
    if (response is SuccessResponse<bool>) {
      emit(SignUpSuccess());
    } else {
      emit(SignUpFailure((response as FailureResponse).message));
    }
  }
}
