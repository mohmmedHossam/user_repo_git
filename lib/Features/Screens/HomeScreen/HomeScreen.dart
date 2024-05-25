import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:user_repo_git/Core/Managers/ColorManager.dart';
import 'package:user_repo_git/Core/Managers/image_manager.dart';
import 'package:user_repo_git/Core/Managers/text_styles.dart';
import 'package:user_repo_git/Core/Utils/utils.dart';
import 'package:user_repo_git/Core/Widgets/edit_text.dart';
import 'package:user_repo_git/Core/Widgets/text_view.dart';
import 'package:user_repo_git/Core/extensions/context_extension.dart';
import 'package:user_repo_git/Features/Controllers/user_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userNameController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserLoading) {
            setState(() {
              _isLoading = true;
            });
          } else if (state is UserSuccess) {
            setState(() {
              _isLoading = false;
            });
          } else {
            setState(() {
              _isLoading = false;
            });
          }
        },
        builder: (context, state) {
          return Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: "Welcome to Fetch your Data ",
                    style: TextStyle(
                        color: ColorManager.darkBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                    children: [
                      TextSpan(
                          text: '\n Please follow the instructions',
                          style: TextStyle(
                              color: ColorManager.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 20))
                    ]),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: EditText(
                      multiLang: false,
                      paddingHorizontal: 6,
                      controller: userNameController,
                      hint: " Enter Your User Name On GitHub")),
              ElevatedButton(
                  onPressed: () {
                    if (!_isLoading && userNameController.text.isNotEmpty) {
                      context
                          .read<UserCubit>()
                          .getUserData(userNameController.text);
                    } else {
                      Utils.showToast("please Enter Your user Name On Github");
                    }
                  },
                  child: const Text('Search')),
              _isLoading
                  ? Container(
                      width: context.screenWidth * 0.4,
                      height: context.screenHeight * 0.2,
                      child: Lottie.asset(ImageManager.loading),
                    )
                  : state is UserSuccess
                      ? Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorManager.darkBlue, width: 4),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      state.userModel.avatarUrl ?? ""),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      TextView(
                                        multiLan: false,
                                        text: "User Name :  ",
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyleManager.textStyleSemiBold,
                                      ),
                                      TextView(
                                          multiLan: false,
                                          text:
                                              state.userModel.login ?? 'Guest',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyleManager
                                              .textStyleRegular),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextView(
                                        multiLan: false,
                                        text: "Followers :  ",
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyleManager.textStyleSemiBold,
                                      ),
                                      TextView(
                                          multiLan: false,
                                          text:
                                              " ${state.userModel.followers ?? 0}",
                                          style: TextStyleManager
                                              .textStyleRegular),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextView(
                                        multiLan: false,
                                        text: "Repositories :  ",
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyleManager.textStyleSemiBold,
                                      ),
                                      TextView(
                                          multiLan: false,
                                          text:
                                              " ${state.userModel.publicRepos ?? 0}",
                                          style:
                                              TextStyleManager.textStyleRegular)
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : state is UserNotFound
                          ? Container(
                              margin: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Container(
                                    width: context.screenWidth * 0.4,
                                    height: context.screenHeight * 0.2,
                                    child: Lottie.asset(ImageManager.notFound),
                                  ),
                                  TextView(
                                    multiLan: false,
                                    text: 'This User Not Found',
                                    style: TextStyleManager.textStyleBold,
                                  ),
                                ],
                              ),
                            )
                          : state is UserFailure ? Container(
                              width: context.screenWidth * 0.4,
                              height: context.screenHeight * 0.2,
                              child: Lottie.asset(ImageManager.error),
                            ) : Container(),
            ],
          ));
        },
      ),
    );
  }
}
