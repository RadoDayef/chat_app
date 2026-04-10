import 'package:chat_app/structure/core/routing/routing_names.dart';
import 'package:chat_app/structure/features/home/ui/home_screen.dart';
import 'package:chat_app/structure/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutingRouter {
  RoutingRouter._();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (RoutingNames.fromRoute(settings.name)) {
      case RoutingNames.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutingNames.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
