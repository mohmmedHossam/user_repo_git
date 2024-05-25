import 'package:flutter/material.dart';
import 'package:user_repo_git/Core/Managers/size_manager.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid(
      {super.key,
      required this.item,
      required this.itemCount,
      this.padding,
      this.physics,
      this.shrink});

  final int itemCount;
  final Widget item;
  final EdgeInsets? padding;
  final bool? shrink;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: shrink ?? false,
        padding: padding,
        physics: physics,
        //const EdgeInsets.only(bottom:SizeManager.sizeSpacing4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: SizeManager.sizeGridProduct,
          mainAxisSpacing: SizeManager.sizeSpacing10,
          crossAxisCount: 2,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return item;
        });
  }
}
