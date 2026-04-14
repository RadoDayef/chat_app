import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/core/shared/widgets/auth_button_widget.dart';
import 'package:chat_app/core/shared/widgets/auth_form_field_widget.dart';
import 'package:chat_app/core/shared/widgets/auth_text_button_widget.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:chat_app/core/utils/constants/constant_images.dart';
import 'package:chat_app/core/utils/extensions/string_extensions.dart';
import 'package:chat_app/features/auth/sign_in/data/models/sign_in_with_model.dart';
import 'package:chat_app/features/auth/sign_in/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_numkit/flutter_numkit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SignInWithModel> signInWith = [
      SignInWithModel(image: ConstantImages.google, onTap: () => "This feature is not available.".showToast),
      SignInWithModel(image: ConstantImages.apple, onTap: () => "This feature is not available.".showToast),
      SignInWithModel(image: ConstantImages.facebook, onTap: () => "This feature is not available.".showToast),
    ];
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
                        "Hello, Welcome Back",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: ThemingColors.blackColor),
                      ),
                      Text("Happy to see you again, to use your account please login first.", style: TextStyle(fontSize: 16, color: ThemingColors.blackColor)),
                    ],
                  ),
                ),
                16.verticalGap,
                AuthFormFieldWidget("Email", icon: Icons.email_rounded, controller: context.read<SignInCubit>().emailController),
                16.verticalGap,
                AuthFormFieldWidget("Password", icon: Icons.lock_rounded, obscureText: true, controller: context.read<SignInCubit>().passwordController),
                4.verticalGap,
                Align(
                  alignment: .centerEnd,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed(RoutingNames.forgetPassword.route),
                    child: Text("Forget Password?", style: TextStyle(fontSize: 12, color: ThemingColors.redColor)),
                  ),
                ),
                32.verticalGap,
                BlocListener<SignInCubit, SignInState>(
                  listener: (context, state) {
                    if (state is SignInSuccess) {
                      Navigator.of(context).pushReplacementNamed(RoutingNames.home.route);
                    } else if (state is SignInFailure) {
                      state.message.showToast;
                    }
                  },
                  child: BlocBuilder<SignInCubit, SignInState>(
                    builder: (context, state) {
                      return AuthButtonWidget("Sign In", isLoading: state is SignInLoading, onTap: state is SignInLoading ? null : () => context.read<SignInCubit>().signIn());
                    },
                  ),
                ),
                12.verticalGap,
                AuthTextButtonWidget(subTitle: "Sign Up", title: "Don't have an account? ", onTap: () => Navigator.of(context).pushReplacementNamed(RoutingNames.signUp.route)),
                24.verticalGap,
                Row(
                  children: [
                    Expanded(child: Divider(endIndent: 12)),
                    Text("Or Login with", style: TextStyle(fontSize: 16, color: ThemingColors.blackColor)),
                    Expanded(child: Divider(indent: 12)),
                  ],
                ),
                24.verticalGap,
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: signInWith.map((signInWith) {
                    return InkWell(onTap: signInWith.onTap, child: Image.asset(signInWith.image, width: 32));
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
