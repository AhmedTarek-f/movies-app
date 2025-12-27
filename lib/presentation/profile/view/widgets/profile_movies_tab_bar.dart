import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/constants/const_keys.dart';

class ProfileMoviesTabBar extends StatelessWidget {
  const ProfileMoviesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 100.h,
      flexibleSpace: FlexibleSpaceBar(
        background: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const RSizedBox(height: 18),
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: theme.textTheme.titleLarge?.copyWith(
                  fontFamily: ConstKeys.roboto,
                  fontWeight: FontWeight.w400,
                  color: theme.colorScheme.primary,
                ),
                unselectedLabelStyle: theme.textTheme.titleLarge?.copyWith(
                  fontFamily: ConstKeys.roboto,
                  fontWeight: FontWeight.w400,
                  color: theme.colorScheme.secondary,
                ),
                tabs: [
                  Tab(
                    iconMargin: REdgeInsets.only(bottom: 12),
                    icon: SvgPicture.asset(AppIcons.menu),
                    text: AppText.watchList,
                  ),
                  Tab(
                    icon: SvgPicture.asset(AppIcons.folder),
                    text: AppText.history,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
