import 'package:chat_app/core/routing/routing_router.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutingRouter.onGenerateRoute,
      theme: ThemeData(scaffoldBackgroundColor: ThemingColors.whiteColor),
    );
  }
}
