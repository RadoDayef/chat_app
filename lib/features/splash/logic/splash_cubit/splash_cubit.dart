import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:chat_app/features/splash/data/splash_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_numkit/flutter_numkit.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepo _repo;

  SplashCubit(this._repo) : super(SplashLoading()) {
    Future.microtask(() => checkWhereTo());
  }

  final User? _user = FirebaseAuth.instance.currentUser;

  void checkWhereTo() async {
    if (_user != null && _user.emailVerified) {
      ResponseResult<UserModel> response = await _repo.getCurrentUserData(_user.uid);
      if (response is SuccessResponse<UserModel>) {
        Future.delayed(5.sec, () => emit(SplashSuccess(RoutingNames.home.route)));
      } else {
        Future.delayed(5.sec, () => emit(SplashFailure((response as FailureResponse).message)));
      }
    } else {
      Future.delayed(5.sec, () => emit(SplashSuccess(RoutingNames.onBoarding.route)));
    }
  }
}
