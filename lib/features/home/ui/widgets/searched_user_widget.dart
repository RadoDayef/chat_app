import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_numkit/flutter_numkit.dart';

class SearchedUserWidget extends StatelessWidget {
  final UserModel user;

  const SearchedUserWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 12.allEdgeInsets,
      decoration: BoxDecoration(
        borderRadius: 16.allBorderRadius,
        border: Border.all(color: ThemingColors.navyColor, width: 2),
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
              child: Image.network(user.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
            ),
          ),
          12.horizontalGap,
          Text(
            user.name,
            maxLines: 1,
            overflow: .ellipsis,
            style: TextStyle(color: ThemingColors.blackColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
