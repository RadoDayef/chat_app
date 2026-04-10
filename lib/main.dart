import 'package:chat_app/chat_app.dart';
import 'package:chat_app/core/dependency_injection/dependency_injection.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/structure/core/utils/observers/states_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  Bloc.observer = StatesObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatApp());
}
