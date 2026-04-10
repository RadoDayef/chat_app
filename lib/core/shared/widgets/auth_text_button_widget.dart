import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:flutter/material.dart';

class AuthTextButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title, subTitle;

  const AuthTextButtonWidget({required this.title, required this.onTap, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(fontSize: 12, color: ThemingColors.blackColor),
          ),
          WidgetSpan(
            child: InkWell(
              onTap: onTap,
              child: Text(
                subTitle,
                style: TextStyle(fontSize: 12, color: ThemingColors.navyColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
