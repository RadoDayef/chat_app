import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/core/shared/widgets/auth_button_widget.dart';
import 'package:chat_app/core/shared/widgets/auth_form_field_widget.dart';
import 'package:chat_app/core/shared/widgets/auth_text_button_widget.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:chat_app/core/utils/extensions/string_extensions.dart';
import 'package:chat_app/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_numkit/flutter_numkit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: .all(12),
            child: Column(
              children: [
                Align(
                  alignment: .centerLeft,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Hello, Forgot Your Password?",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: ThemingColors.blackColor),
                      ),
                      Text("No worries, enter your email and we’ll help you reset it.", style: TextStyle(fontSize: 16, color: ThemingColors.blackColor)),
                    ],
                  ),
                ),
                16.verticalGap,
                AuthFormFieldWidget("Email", icon: Icons.email_rounded, controller: context.read<ForgetPasswordCubit>().emailController),
                32.verticalGap,
                BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    if (state is ForgetPasswordSuccess) {
                      "Email sent successfully".showToast;
                      Navigator.of(context).pushReplacementNamed(RoutingNames.signIn.route);
                    } else if (state is ForgetPasswordFailure) {
                      state.message.showToast;
                    }
                  },
                  child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    builder: (context, state) {
                      return AuthButtonWidget(
                        "Send",
                        isLoading: state is ForgetPasswordLoading,
                        onTap: state is ForgetPasswordLoading ? null : () => context.read<ForgetPasswordCubit>().forgetPassword(),
                      );
                    },
                  ),
                ),
                12.verticalGap,
                AuthTextButtonWidget(subTitle: "Sign In", title: "Remember Password? ", onTap: () => Navigator.of(context).pushReplacementNamed(RoutingNames.signIn.route)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
