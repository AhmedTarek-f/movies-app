import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/presentation/home/views/widgets/action_movies_list.dart';

class ActionMoviesSection extends StatelessWidget {
  const ActionMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  AppText.action.tr(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w400,
                    fontFamily: ConstKeys.roboto,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerEnd,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${AppText.seeMore.tr()} ",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: theme.colorScheme.primary,
                          size: 14.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const RSizedBox(height: 12),
          const ActionMoviesList(),
        ],
      ),
    );
  }
}
