import 'package:chat_app/core/dependency_injection/dependency_injection.dart';
import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:chat_app/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:chat_app/features/auth/sign_in/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:chat_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:chat_app/features/chat/ui/chat_screen.dart';
import 'package:chat_app/features/home/ui/home_screen.dart';
import 'package:chat_app/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:chat_app/features/splash/logic/splash_cubit/splash_cubit.dart';
import 'package:chat_app/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutingRouter {
  RoutingRouter._();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (RoutingNames.fromRoute(settings.name)) {
      case RoutingNames.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutingNames.chat:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case RoutingNames.splash:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => DependencyInjection.getIt<SplashCubit>(), child: SplashScreen()),
        );
      case RoutingNames.signIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => DependencyInjection.getIt<SignInCubit>(), child: SignInScreen()),
        );
      case RoutingNames.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => DependencyInjection.getIt<SignUpCubit>(), child: SignUpScreen()),
        );
      case RoutingNames.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case RoutingNames.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => DependencyInjection.getIt<ForgetPasswordCubit>(), child: ForgetPasswordScreen()),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
