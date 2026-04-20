import 'package:chat_app/core/shared/models/message_model.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_numkit/flutter_numkit.dart';

class MessageItemWidget extends StatelessWidget {
  final MessageModel message;

  const MessageItemWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    String myId = FirebaseAuth.instance.currentUser?.uid ?? "";
    return Column(
      crossAxisAlignment: message.senderId == myId ? .end : .start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: message.senderId == myId ? ThemingColors.navyColor : null,
            border: .all(color: message.senderId == myId ? ThemingColors.transparentColor : ThemingColors.navyColor),
            borderRadius: 16.onlyBorderRadius(bottomLeft: message.senderId == myId ? null : 0, bottomRight: message.senderId != myId ? null : 0),
          ),
          // alignment: message.senderId == myId ? .centerRight : .centerLeft,
          padding: 12.allEdgeInsets,
          margin: 0.onlyEdgeInsets(left: message.senderId == myId ? 20.percentOf(context.screenWidth) : null, right: message.senderId != myId ? 20.percentOf(context.screenWidth) : null),
          child: Text(message.text, style: TextStyle(color: message.senderId == myId ? ThemingColors.whiteColor : ThemingColors.blackColor)),
        ),
      ],
    );
  }
}
