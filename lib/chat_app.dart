import 'package:chat_app/core/routing/routing_router.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RoutingRouter.onGenerateRoute,
    );
  }
}
