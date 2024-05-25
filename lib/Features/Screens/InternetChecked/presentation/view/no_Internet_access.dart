import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user_repo_git/Core/Managers/ColorManager.dart';
import 'package:user_repo_git/Core/Managers/image_manager.dart';

import 'package:user_repo_git/Core/extensions/context_extension.dart';

import '../../../../../Core/Widgets/text_view.dart';

class NoInternetAccessPage extends StatelessWidget {
  const NoInternetAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(ImageManager.noInternet,
                  width: context.screenWidth * 0.6,
                  height: context.screenHeight * 0.4),
              const SizedBox(
                height: 20,
              ),
              TextView(
                multiLan: false,
                text: 'No Internet Access',
                textAlign: TextAlign.center,
                style:
                const TextStyle(fontSize: 21, color: ColorManager.darkBlue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
