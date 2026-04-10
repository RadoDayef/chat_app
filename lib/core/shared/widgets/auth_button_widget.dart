import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AuthButtonWidget extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onTap;

  const AuthButtonWidget(this.title, {required this.onTap, this.isLoading = false, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: .infinity,
        alignment: .center,
        padding: .all(12),
        margin: .symmetric(horizontal: 32),
        decoration: BoxDecoration(color: ThemingColors.navyColor, borderRadius: .circular(16)),
        child: isLoading ? LoadingAnimationWidget.horizontalRotatingDots(color: ThemingColors.whiteColor, size: 22) : Text(title, style: TextStyle(color: ThemingColors.whiteColor, fontSize: 20)),
      ),
    );
  }
}
