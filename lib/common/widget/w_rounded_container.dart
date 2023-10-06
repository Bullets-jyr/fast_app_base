import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final Color? backgroundColor;

  const RoundedContainer(
      {super.key,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      required this.child,
      this.radius = 20,
      // default value들은 무조건 상수가되어야 하기 때문에 nullable처리를 하였습니다.
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.appColors.roundedLayoutBackground,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
