import 'package:chat_app/core/routing/routing_names.dart';
import 'package:chat_app/core/shared/widgets/auth_button_widget.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:chat_app/core/utils/constants/constant_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_numkit/flutter_numkit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .all(12),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            children: [
              Spacer(),
              Text(
                "Get Closer To EveryOne",
                style: TextStyle(color: ThemingColors.blackColor, fontSize: 32, fontWeight: .w800),
              ),
              12.verticalGap,
              Text("Helps you to contact everyone with just easy way", style: TextStyle(fontSize: 16, color: ThemingColors.blackColor)),
              Spacer(),
              Image.asset(ConstantImages.onBoarding),
              Spacer(),
              AuthButtonWidget("Get Started", onTap: () => Navigator.of(context).pushReplacementNamed(RoutingNames.signIn.route)),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
