import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:chat_app/core/utils/extensions/date_time_extensions.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_numkit/flutter_numkit.dart';

class ChatItemWidget extends StatelessWidget {
  final ChatModel chat;

  const ChatItemWidget(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    String myID = FirebaseAuth.instance.currentUser?.uid ?? "";

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(RoutingNames.chat.route, arguments: chat),
      child: Container(
        padding: 12.allEdgeInsets,
        decoration: BoxDecoration(
          borderRadius: 16.allBorderRadius,
          border: .all(color: ThemingColors.navyColor, width: 2),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: .circle,
                border: .all(width: 2, color: ThemingColors.navyColor),
              ),
              child: ClipRRect(
                borderRadius: 999.allBorderRadius,
                child: Image.network(chat.otherUser.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              ),
            ),
            12.horizontalGap,
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    chat.otherUser.name,
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: TextStyle(color: ThemingColors.blackColor, fontSize: 16),
                  ),
                  4.verticalGap,
                  Row(
                    crossAxisAlignment: .center,
                    children: [
                      if (chat.lastMessage.senderId == myID) ...[Icon(Icons.check_rounded, color: ThemingColors.blackColor.withAlpha((0.4 * 255).toInt()), size: 12), 4.horizontalGap],
                      Expanded(
                        child: Text(
                          chat.lastMessage.text,
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: TextStyle(color: ThemingColors.blackColor.withAlpha((0.4 * 255).toInt()), fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            12.horizontalGap,
            Column(
              children: [
                Text(chat.lastTimeStamp.formateChatTime, style: TextStyle(color: ThemingColors.blackColor, fontSize: 12)),
                if (chat.lastMessage.senderId == myID && chat.nonSeenCount > 0) ...[
                  4.verticalGap,
                  Container(
                    padding: 6.allEdgeInsets,
                    decoration: BoxDecoration(color: ThemingColors.navyColor, shape: .circle),
                    child: Text(chat.nonSeenCount.toString(), style: TextStyle(color: ThemingColors.whiteColor, fontSize: 12)),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
