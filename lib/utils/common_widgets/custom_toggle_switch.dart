import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({
    super.key,
    required this.firstIcon,
    required this.secondIcon,
    required this.currentIndex,
    this.onIndexChanged,
    this.firstIconColor,
    this.secondIconColor,
  });
  final String firstIcon;
  final String secondIcon;
  final int currentIndex;
  final FutureOr<void> Function(int)? onIndexChanged;
  final ColorFilter? firstIconColor;
  final ColorFilter? secondIconColor;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
      current: currentIndex,
      values: const [0, 1],
      iconList: [
        SvgPicture.asset(
          firstIcon,
          fit: BoxFit.cover,
          height: 27.r,
          width: 27.r,
          colorFilter: firstIconColor,
        ),
        SvgPicture.asset(
          secondIcon,
          fit: BoxFit.cover,
          height: 27.r,
          width: 27.r,
          colorFilter: secondIconColor,
        ),
      ],
      borderWidth: 2,
      iconOpacity: 1,
      inactiveOpacity: 1,
      height: 38.h,
      spacing: 20.w,
      indicatorSize: Size.fromWidth(34.w),
      style: ToggleStyle(
        borderColor: Theme.of(context).colorScheme.primary,
        indicatorColor: Theme.of(context).colorScheme.primary,
        indicatorBorder: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 5.r,
        ),
        backgroundColor: Colors.transparent,
      ),
      onChanged: onIndexChanged,
    );
  }
}
