import 'package:chat_app/features/auth/forget_password/data/forget_password_repo.dart';
import 'package:chat_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:chat_app/features/auth/sign_in/data/sign_in_repo.dart';
import 'package:chat_app/features/auth/sign_in/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/auth/sign_up/data/sign_up_repo.dart';
import 'package:chat_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/features/home/data/home_repo.dart';
import 'package:chat_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:chat_app/features/splash/data/splash_repo.dart';
import 'package:chat_app/features/splash/logic/splash_cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  DependencyInjection._();

  static final GetIt getIt = GetIt.instance;

  static Future<void> init() async {
    /// Repos
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());
    getIt.registerLazySingleton<SplashRepo>(() => SplashRepo());
    getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo());
    getIt.registerLazySingleton<SignInRepo>(() => SignInRepo());
    getIt.registerLazySingleton<ForgetPasswordRepo>(() => ForgetPasswordRepo());

    /// Cubits
    getIt.registerFactory(() => HomeCubit(getIt<HomeRepo>()));
    getIt.registerFactory(() => SplashCubit(getIt<SplashRepo>()));
    getIt.registerFactory(() => SignUpCubit(getIt<SignUpRepo>()));
    getIt.registerFactory(() => SignInCubit(getIt<SignInRepo>()));
    getIt.registerFactory(() => ForgetPasswordCubit(getIt<ForgetPasswordRepo>()));
  }
}
