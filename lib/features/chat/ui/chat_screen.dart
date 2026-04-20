import 'package:chat_app/core/shared/models/message_model.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:chat_app/features/chat/logic/chat_cubit/chat_cubit.dart';
import 'package:chat_app/features/chat/ui/widgets/message_item_widget.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_numkit/flutter_numkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChatScreen extends StatelessWidget {
  final ChatModel chat;

  const ChatScreen(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemingColors.whiteColor,
      appBar: AppBar(
        title: Text(chat.otherUser.name),
        actions: [
          Container(
            decoration: BoxDecoration(shape: .circle),
            child: ClipRRect(
              borderRadius: 999.allBorderRadius,
              child: Image.network(chat.otherUser.imageUrl, width: 35, height: 35, fit: BoxFit.cover),
            ),
          ),
          16.horizontalGap,
        ],
        elevation: 4,
        shadowColor: ThemingColors.blackColor,
        backgroundColor: ThemingColors.whiteColor,
        foregroundColor: ThemingColors.blackColor,
        surfaceTintColor: ThemingColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: 0.verticalBorderRadius(bottom: 16)),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  return Center(child: LoadingAnimationWidget.horizontalRotatingDots(color: ThemingColors.blackColor, size: 22));
                } else if (state is ChatFailure) {
                  return Center(
                    child: Text(state.message, style: TextStyle(color: ThemingColors.blackColor, fontSize: 24)),
                  );
                } else if (state is ChatSuccess) {
                  return ListView.separated(
                    reverse: true,
                    padding: 16.allEdgeInsets,
                    itemCount: state.messages.length,
                    itemBuilder: (_, int index) {
                      MessageModel message = state.messages[index];
                      return MessageItemWidget(message);
                    },
                    separatorBuilder: (_, _) {
                      return 8.verticalGap;
                    },
                  );
                }
                return Center(
                  child: Text("Something Went Wrong", style: TextStyle(color: ThemingColors.blackColor, fontSize: 24)),
                );
              },
            ),
          ),
          Padding(
            padding: 16.onlyEdgeInsets(top: 0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Type a message",
                      fillColor: ThemingColors.blackColor.withAlpha((0.05 * 255).toInt()),
                      border: OutlineInputBorder(
                        borderRadius: 16.allBorderRadius,
                        borderSide: BorderSide(color: ThemingColors.transparentColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: 16.allBorderRadius,
                        borderSide: BorderSide(color: ThemingColors.transparentColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: 16.allBorderRadius,
                        borderSide: BorderSide(color: ThemingColors.transparentColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: 16.allBorderRadius,
                        borderSide: BorderSide(color: ThemingColors.transparentColor),
                      ),
                    ),
                  ),
                ),
                16.horizontalGap,
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(color: ThemingColors.blackColor.withAlpha((0.05 * 255).toInt()), borderRadius: 16.allBorderRadius),
                  child: Icon(Icons.send_rounded, color: ThemingColors.blackColor, size: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
