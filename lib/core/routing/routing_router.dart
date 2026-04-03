import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:chat_app/features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:chat_app/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:chat_app/features/chat/ui/chat_screen.dart';
import 'package:chat_app/features/home/ui/home_screen.dart';
import 'package:chat_app/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:chat_app/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutingRouter {
  RoutingRouter._();
  static Route onGenerateRoute(RouteSettings settings){
    switch(RoutingNames.fromRoute(settings.name)){
      case RoutingNames.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutingNames.chat:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case RoutingNames.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutingNames.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case RoutingNames.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case RoutingNames.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case RoutingNames.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}