import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user_repo_git/Core/Managers/text_styles.dart';
import 'package:user_repo_git/Core/Widgets/text_view.dart';

class ErrorData extends StatefulWidget {
  final bool isHorizontal ;
  const ErrorData({super.key, this.isHorizontal = false});

  @override
  State<ErrorData> createState() => _ErrorState();
}

class _ErrorState extends State<ErrorData> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:widget.isHorizontal ? Center(
        child:  TextButton(
              onPressed: () {

              },
              child: TextView(
                multiLan: false,
                text: "Op's UnExpected Error! try again.",
                style: TextStyleManager.textStyleBold,
              ))
      ):  Column(
        children: [
          Lottie.asset(
            'assets/json/error.json',
            controller: _controller,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              _controller
                ..duration = composition.duration
                ..forward();
            },
          ),
          TextButton(
              onPressed: () {

              },
              child: TextView(
                multiLan: false,
                text: "Op's UnExpected Error! try again.",
                style: TextStyleManager.textStyleBold,
              ))
        ],
      ),
    );
  }
}
