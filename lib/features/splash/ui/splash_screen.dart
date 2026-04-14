import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:chat_app/core/utils/extensions/string_extensions.dart';
import 'package:chat_app/features/splash/logic/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_numkit/flutter_numkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashSuccess) {
              Navigator.of(context).pushReplacementNamed(state.route);
            } else if (state is SplashFailure) {
              state.message.showToast;
              Navigator.of(context).pushReplacementNamed(RoutingNames.onBoarding.route);
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Spacer(),
                Container(
                  padding: 12.allEdgeInsets,
                  decoration: BoxDecoration(color: ThemingColors.navyColor, borderRadius: 12.allBorderRadius),
                  child: Icon(Icons.wechat_outlined, color: ThemingColors.whiteColor, size: 56),
                ),
                12.verticalGap,
                Text(
                  "Chat App",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: ThemingColors.blackColor),
                ),
                Spacer(),
                LoadingAnimationWidget.horizontalRotatingDots(color: ThemingColors.navyColor, size: 22),
                12.verticalGap,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
