import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:chat_app/features/home/logic/home_search_cubit/home_search_cubit.dart';
import 'package:chat_app/features/home/ui/widgets/chat_item_widget.dart';
import 'package:chat_app/features/home/ui/widgets/searched_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_numkit/flutter_numkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: LoadingAnimationWidget.horizontalRotatingDots(color: ThemingColors.navyColor, size: 22));
            } else if (state is HomeFailure) {
              return Center(
                child: Text(state.message, style: TextStyle(color: ThemingColors.blackColor, fontSize: 24)),
              );
            } else if (state is HomeSuccess) {
              return SingleChildScrollView(
                padding: 16.allEdgeInsets,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onTapOutside: (_) => context.hideKeyboard,
                            controller: context.read<HomeSearchCubit>().searchController,
                            onChanged: (_) => context.read<HomeSearchCubit>().searchForUser(),
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: Icon(Icons.search, color: ThemingColors.blackColor),
                              hintText: "Search Chat",
                              fillColor: ThemingColors.blackColor.withAlpha((0.05 * 255).toInt()),
                              border: OutlineInputBorder(
                                borderRadius: 16.allBorderRadius,
                                borderSide: BorderSide(color: ThemingColors.transparentColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: 16.allBorderRadius,
                                borderSide: BorderSide(color: ThemingColors.transparentColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: 16.allBorderRadius,
                                borderSide: BorderSide(color: ThemingColors.transparentColor),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: 16.allBorderRadius,
                                borderSide: BorderSide(color: ThemingColors.transparentColor),
                              ),
                            ),
                          ),
                        ),
                        16.horizontalGap,
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(color: ThemingColors.blackColor.withAlpha((0.05 * 255).toInt()), borderRadius: 16.allBorderRadius),
                          child: Icon(Icons.qr_code_rounded, color: ThemingColors.blackColor, size: 24),
                        ),
                      ],
                    ),
                    BlocBuilder<HomeSearchCubit, HomeSearchState>(
                      builder: (context, state) {
                        if (state is! HomeSearchInitial) {
                          return Column(
                            children: [
                              12.verticalGap,
                              if (state is HomeSearchLoading) ...[
                                Center(child: LoadingAnimationWidget.horizontalRotatingDots(color: ThemingColors.navyColor, size: 14)),
                              ] else if (state is HomeSearchFailure) ...[
                                Center(
                                  child: Text(state.message, style: TextStyle(color: ThemingColors.blackColor, fontSize: 16)),
                                ),
                              ] else if (state is HomeSearchSuccess) ...[
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.users.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, int index) {
                                    UserModel user = state.users[index];
                                    return SearchedUserWidget(user);
                                  },
                                  separatorBuilder: (_, _) {
                                    return 12.verticalGap;
                                  },
                                ),
                              ] else ...[
                                0.squareGap,
                              ],
                              Divider(height: 24, thickness: 2),
                            ],
                          );
                        } else {
                          return 0.squareGap;
                        }
                      },
                    ),
                    24.verticalGap,
                    state.chats.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemCount: state.chats.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (_, int index) {
                              ChatModel chat = state.chats[index];
                              return ChatItemWidget(chat);
                            },
                            separatorBuilder: (_, _) {
                              return 12.verticalGap;
                            },
                          )
                        : Center(
                            child: Text("No Chats Found", style: TextStyle(color: ThemingColors.blackColor, fontSize: 22)),
                          ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("Something Went Wrong", style: TextStyle(color: ThemingColors.blackColor, fontSize: 24)),
              );
            }
          },
        ),
      ),
    );
  }
}
