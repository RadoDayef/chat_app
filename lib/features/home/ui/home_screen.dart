import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_numkit/flutter_numkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: LoadingAnimationWidget.horizontalRotatingDots(color: ThemingColors.navyColor, size: 22));
            } else if (state is HomeFailure) {
              return Center(
                child: Text(state.message, style: TextStyle(color: ThemingColors.blackColor, fontSize: 24)),
              );
            } else if (state is HomeSuccess) {
              if (state.chats.isNotEmpty) {
                return ListView.separated(
                  itemCount: state.chats.length,
                  itemBuilder: (_, int index) {
                    ChatModel chat = state.chats[index];
                    return ListTile(
                      title: Text("Chat $index"),
                      onTap: () {
                        Navigator.of(context).pushNamed(RoutingNames.chat.route, arguments: chat);
                      },
                    );
                  },
                  separatorBuilder: (_, _) {
                    return 12.verticalGap;
                  },
                );
              }
              return Center(
                child: Text("No Chats Found", style: TextStyle(color: ThemingColors.blackColor, fontSize: 24)),
              );
            }
            return Center(
              child: Text("Something Went Wrong", style: TextStyle(color: ThemingColors.blackColor, fontSize: 24)),
            );
          },
        ),
      ),
    );
  }
}
