import 'package:chat_app/core/dependency_injection/dependency_injection.dart';
import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:chat_app/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:chat_app/features/auth/sign_in/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:chat_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/features/auth/sign_up/logic/sign_up_image_cubit/sign_up_image_cubit.dart';
import 'package:chat_app/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:chat_app/features/chat/logic/chat_cubit/chat_cubit.dart';
import 'package:chat_app/features/chat/logic/chat_send_message_cubit/chat_send_message_cubit.dart';
import 'package:chat_app/features/chat/ui/chat_screen.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:chat_app/features/home/logic/home_search_cubit/home_search_cubit.dart';
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
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => DependencyInjection.getIt<HomeCubit>()),
              BlocProvider(create: (context) => DependencyInjection.getIt<HomeSearchCubit>()),
            ],
            child: HomeScreen(),
          ),
        );
      case RoutingNames.chat:
        ChatModel chatArgs = settings.arguments as ChatModel;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => DependencyInjection.getIt<ChatCubit>(param1: chatArgs.id)),
              BlocProvider(create: (context) => DependencyInjection.getIt<ChatSendMessageCubit>(param1: chatArgs.id)),
            ],
            child: ChatScreen(chatArgs),
          ),
        );
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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => DependencyInjection.getIt<SignUpCubit>()),
              BlocProvider(create: (context) => DependencyInjection.getIt<SignUpImageCubit>()),
            ],
            child: SignUpScreen(),
          ),
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
