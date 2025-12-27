import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/const_keys.dart';
import 'package:movies_app/utils/movies_method_helper.dart';
import 'package:movies_app/core/constants/app_text.dart';

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 59,
                backgroundImage: AssetImage(
                  MoviesMethodHelper
                      .avatars[MoviesMethodHelper.userData?.selectedImage ?? 0],
                ),
              ),
              const RSizedBox(height: 16),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  MoviesMethodHelper.userData?.fullName ?? "",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontFamily: ConstKeys.roboto,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
          const RSizedBox(width: 32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            MoviesMethodHelper.userData?.watchListIds?.length
                                    .toString() ??
                                "0",
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFamily: ConstKeys.roboto,
                            ),
                          ),
                        ),
                        const RSizedBox(height: 20),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            AppText.watchList,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontFamily: ConstKeys.roboto,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const RSizedBox(width: 32),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            MoviesMethodHelper.userData?.historyListIds?.length
                                    .toString() ??
                                "0",
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFamily: ConstKeys.roboto,
                            ),
                          ),
                        ),
                        const RSizedBox(height: 20),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            AppText.history,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontFamily: ConstKeys.roboto,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
