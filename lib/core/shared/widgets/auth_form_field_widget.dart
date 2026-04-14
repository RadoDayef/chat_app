import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_numkit/flutter_numkit.dart';

class AuthFormFieldWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AuthFormFieldWidget(this.title, {required this.controller, this.icon, this.validator, this.obscureText = false, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => context.hideKeyboard,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: title,
        prefixIcon: icon != null ? Icon(icon, color: ThemingColors.greyColor) : null,
        border: OutlineInputBorder(
          borderRadius: 16.allBorderRadius,
          borderSide: BorderSide(color: ThemingColors.greyColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: 16.allBorderRadius,
          borderSide: BorderSide(color: ThemingColors.greyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: 16.allBorderRadius,
          borderSide: BorderSide(color: ThemingColors.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 16.allBorderRadius,
          borderSide: BorderSide(color: ThemingColors.greyColor),
        ),
      ),
    );
  }
}
