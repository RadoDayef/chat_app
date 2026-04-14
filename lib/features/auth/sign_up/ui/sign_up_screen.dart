import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/core/shared/widgets/auth_button_widget.dart';
import 'package:chat_app/core/shared/widgets/auth_form_field_widget.dart';
import 'package:chat_app/core/shared/widgets/auth_text_button_widget.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:chat_app/core/utils/extensions/string_extensions.dart';
import 'package:chat_app/features/auth/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_numkit/flutter_numkit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                        "Hello, Welcome!",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: ThemingColors.blackColor),
                      ),
                      Text("We’re happy to have you here.", style: TextStyle(fontSize: 16, color: ThemingColors.blackColor)),
                    ],
                  ),
                ),
                16.verticalGap,
                Stack(
                  children: [
                    Container(
                      width: 14.percentOf(context.screenHeight),
                      height: 14.percentOf(context.screenHeight),
                      decoration: BoxDecoration(color: ThemingColors.navyColor, shape: BoxShape.circle),
                      child: Icon(Icons.camera_enhance_rounded, color: ThemingColors.whiteColor.withAlpha(150), size: 46),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: 8.allEdgeInsets,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemingColors.navyColor,
                          border: Border.all(color: ThemingColors.whiteColor),
                        ),
                        child: Icon(Icons.add, color: ThemingColors.whiteColor, size: 16),
                      ),
                    ),
                  ],
                ),
                16.verticalGap,
                Row(
                  children: [
                    Expanded(child: AuthFormFieldWidget("First Name", controller: context.read<SignUpCubit>().firstNameController)),
                    16.horizontalGap,
                    Expanded(child: AuthFormFieldWidget("Last Name", controller: context.read<SignUpCubit>().lastNameController)),
                  ],
                ),
                16.verticalGap,
                AuthFormFieldWidget("Email", icon: Icons.email_rounded, controller: context.read<SignUpCubit>().emailController),
                16.verticalGap,
                AuthFormFieldWidget("Password", icon: Icons.lock_rounded, obscureText: true, controller: context.read<SignUpCubit>().passwordController),
                32.verticalGap,
                BlocListener<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpSuccess) {
                      Navigator.of(context).pushNamed(RoutingNames.signIn.route);
                    } else if (state is SignUpFailure) {
                      state.message.showToast;
                    }
                  },
                  child: BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return AuthButtonWidget("Sign Up", isLoading: state is SignUpLoading, onTap: state is SignUpLoading ? null : () => context.read<SignUpCubit>().signUp());
                    },
                  ),
                ),
                12.verticalGap,
                AuthTextButtonWidget(subTitle: "Sign In", title: "Already have an account? ", onTap: () => Navigator.of(context).pushReplacementNamed(RoutingNames.signIn.route)),
                24.verticalGap,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
